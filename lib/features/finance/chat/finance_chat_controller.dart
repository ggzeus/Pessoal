import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../data/local/database/app_database.dart';
import '../../../data/repositories/personal_repository.dart';
import '../../../data/repositories/providers.dart';
import 'finance_chat_formatter.dart';
import 'finance_chat_models.dart';
import 'finance_message_parser.dart';

final financeChatControllerProvider =
    AsyncNotifierProvider<FinanceChatController, FinanceChatState>(
      FinanceChatController.new,
    );

class FinanceChatController extends AsyncNotifier<FinanceChatState> {
  final Uuid _uuid = const Uuid();
  final FinanceChatFormatter _formatter = FinanceChatFormatter();

  late final PersonalRepository _repository;
  late FinanceMessageParser _parser;
  List<FinanceCategory> _categories = const [];

  @override
  Future<FinanceChatState> build() async {
    _repository = ref.read(personalRepositoryProvider);
    await _repository.ensureReady();
    _categories = await _repository.loadFinanceCategories();
    _parser = FinanceMessageParser(_categories);
    final snapshot = await _loadSnapshot();

    return FinanceChatState(
      messages: [
        _assistantMessage(_formatter.welcomeMessage(snapshot.overview)),
      ],
      overview: snapshot.overview,
      recentTransactions: snapshot.transactions,
    );
  }

  Future<void> sendMessage(String rawMessage) async {
    final trimmed = rawMessage.trim();
    if (trimmed.isEmpty) return;

    final current = state.asData?.value;
    if (current == null) return;

    final userMessage = _userMessage(trimmed);
    state = AsyncData(
      current.copyWith(
        messages: [...current.messages, userMessage],
        isSending: true,
      ),
    );

    try {
      final intent = _parser.parse(
        trimmed,
        awaitingClearConfirmation: current.awaitingClearConfirmation,
      );
      await _handleIntent(intent);
    } catch (_) {
      final latest = state.asData?.value ?? current;
      state = AsyncData(
        latest.copyWith(
          messages: [
            ...latest.messages,
            _assistantMessage(_formatter.genericErrorMessage()),
          ],
          isSending: false,
          awaitingClearConfirmation: false,
        ),
      );
    }
  }

  Future<void> _handleIntent(FinanceUserIntent intent) async {
    switch (intent) {
      case FinanceRegisterMovementIntent():
        await _registerMovement(intent);
      case FinanceHistoryIntent():
        await _replyWithHistory();
      case FinanceBalanceIntent():
        await _replyWithBalance();
      case FinanceClearIntent():
        _appendAssistantMessage(
          _formatter.clearConfirmationMessage(),
          awaitingClearConfirmation: true,
        );
      case FinanceConfirmClearIntent():
        await _clearHistory();
      case FinanceHelpIntent():
        _appendAssistantMessage(_formatter.helpMessage());
      case FinanceInvalidIntent():
        _appendAssistantMessage(
          intent.message,
          awaitingClearConfirmation: false,
        );
    }
  }

  Future<void> _registerMovement(FinanceRegisterMovementIntent intent) async {
    if (intent.type == FinanceEntryType.income) {
      await _repository.addIncome(
        intent.amount,
        intent.categoryId,
        description: intent.description,
      );
    } else {
      await _repository.addExpense(
        intent.amount,
        intent.categoryId,
        description: intent.description,
      );
    }

    ref.invalidate(dashboardProvider);
    final snapshot = await _loadSnapshot();
    _replaceStateWithReply(
      _formatter.formatRegisteredMovement(intent),
      snapshot: snapshot,
      awaitingClearConfirmation: false,
    );
  }

  Future<void> _replyWithHistory() async {
    final snapshot = await _loadSnapshot();
    _replaceStateWithReply(
      _formatter.formatHistory(
        snapshot.overview,
        snapshot.transactions.take(8).toList(),
      ),
      snapshot: snapshot,
      awaitingClearConfirmation: false,
    );
  }

  Future<void> _replyWithBalance() async {
    final snapshot = await _loadSnapshot();
    _replaceStateWithReply(
      _formatter.formatBalance(snapshot.overview),
      snapshot: snapshot,
      awaitingClearConfirmation: false,
    );
  }

  Future<void> _clearHistory() async {
    await _repository.clearFinanceTransactions();
    ref.invalidate(dashboardProvider);
    final snapshot = await _loadSnapshot();
    _replaceStateWithReply(
      _formatter.clearSuccessMessage(),
      snapshot: snapshot,
      awaitingClearConfirmation: false,
    );
  }

  void _appendAssistantMessage(
    String text, {
    bool awaitingClearConfirmation = false,
  }) {
    final current = state.asData?.value;
    if (current == null) return;

    state = AsyncData(
      current.copyWith(
        messages: [...current.messages, _assistantMessage(text)],
        awaitingClearConfirmation: awaitingClearConfirmation,
        isSending: false,
      ),
    );
  }

  void _replaceStateWithReply(
    String text, {
    required _FinanceSnapshot snapshot,
    required bool awaitingClearConfirmation,
  }) {
    final current = state.asData?.value;
    if (current == null) return;

    state = AsyncData(
      current.copyWith(
        messages: [...current.messages, _assistantMessage(text)],
        overview: snapshot.overview,
        recentTransactions: snapshot.transactions,
        awaitingClearConfirmation: awaitingClearConfirmation,
        isSending: false,
      ),
    );
  }

  Future<_FinanceSnapshot> _loadSnapshot() async {
    final transactions = await _repository.loadFinanceTransactions();
    final mapped = transactions.map(_toView).toList();
    final totalIncome = mapped
        .where((item) => item.type == FinanceEntryType.income)
        .fold<double>(0, (sum, item) => sum + item.amount);
    final totalExpense = mapped
        .where((item) => item.type == FinanceEntryType.expense)
        .fold<double>(0, (sum, item) => sum + item.amount);

    return _FinanceSnapshot(
      overview: FinanceOverview(
        totalIncome: totalIncome,
        totalExpense: totalExpense,
        balance: totalIncome - totalExpense,
        movementCount: mapped.length,
      ),
      transactions: mapped,
    );
  }

  FinanceTransactionView _toView(FinanceTransaction transaction) {
    final type = transaction.type == 'income'
        ? FinanceEntryType.income
        : FinanceEntryType.expense;
    final description =
        (transaction.description == null ||
            transaction.description!.trim().isEmpty)
        ? 'Movimentacao manual'
        : transaction.description!.trim();
    final categoryName = transaction.categoryId == null
        ? null
        : _categories
              .where((category) => category.id == transaction.categoryId)
              .map((category) => category.name)
              .firstOrNull;

    return FinanceTransactionView(
      id: transaction.id,
      type: type,
      amount: transaction.amount,
      description: description,
      createdAt: transaction.date,
      categoryName: categoryName,
    );
  }

  FinanceChatMessage _userMessage(String text) {
    return FinanceChatMessage(
      id: _uuid.v4(),
      sender: FinanceChatSender.user,
      text: text,
      createdAt: DateTime.now(),
    );
  }

  FinanceChatMessage _assistantMessage(String text) {
    return FinanceChatMessage(
      id: _uuid.v4(),
      sender: FinanceChatSender.assistant,
      text: text,
      createdAt: DateTime.now(),
    );
  }
}

class _FinanceSnapshot {
  const _FinanceSnapshot({required this.overview, required this.transactions});

  final FinanceOverview overview;
  final List<FinanceTransactionView> transactions;
}
