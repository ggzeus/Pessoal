enum FinanceChatSender { user, assistant }

enum FinanceEntryType { income, expense }

extension FinanceEntryTypeX on FinanceEntryType {
  String get repositoryValue =>
      this == FinanceEntryType.income ? 'income' : 'expense';

  String get label => this == FinanceEntryType.income ? 'Entrada' : 'Saida';

  String get historyIcon => this == FinanceEntryType.income ? '🟢' : '🔴';
}

class FinanceChatMessage {
  const FinanceChatMessage({
    required this.id,
    required this.sender,
    required this.text,
    required this.createdAt,
  });

  final String id;
  final FinanceChatSender sender;
  final String text;
  final DateTime createdAt;
}

class FinanceTransactionView {
  const FinanceTransactionView({
    required this.id,
    required this.type,
    required this.amount,
    required this.description,
    required this.createdAt,
    this.categoryName,
  });

  final String id;
  final FinanceEntryType type;
  final double amount;
  final String description;
  final DateTime createdAt;
  final String? categoryName;
}

class FinanceOverview {
  const FinanceOverview({
    required this.totalIncome,
    required this.totalExpense,
    required this.balance,
    required this.movementCount,
  });

  final double totalIncome;
  final double totalExpense;
  final double balance;
  final int movementCount;
}

class FinanceChatState {
  const FinanceChatState({
    required this.messages,
    required this.overview,
    required this.recentTransactions,
    this.awaitingClearConfirmation = false,
    this.isSending = false,
  });

  final List<FinanceChatMessage> messages;
  final FinanceOverview overview;
  final List<FinanceTransactionView> recentTransactions;
  final bool awaitingClearConfirmation;
  final bool isSending;

  FinanceChatState copyWith({
    List<FinanceChatMessage>? messages,
    FinanceOverview? overview,
    List<FinanceTransactionView>? recentTransactions,
    bool? awaitingClearConfirmation,
    bool? isSending,
  }) {
    return FinanceChatState(
      messages: messages ?? this.messages,
      overview: overview ?? this.overview,
      recentTransactions: recentTransactions ?? this.recentTransactions,
      awaitingClearConfirmation:
          awaitingClearConfirmation ?? this.awaitingClearConfirmation,
      isSending: isSending ?? this.isSending,
    );
  }
}

sealed class FinanceUserIntent {
  const FinanceUserIntent();
}

class FinanceRegisterMovementIntent extends FinanceUserIntent {
  const FinanceRegisterMovementIntent({
    required this.type,
    required this.amount,
    required this.description,
    this.categoryId,
    this.categoryName,
    this.compactResponse = false,
  });

  final FinanceEntryType type;
  final double amount;
  final String description;
  final String? categoryId;
  final String? categoryName;
  final bool compactResponse;
}

class FinanceHistoryIntent extends FinanceUserIntent {
  const FinanceHistoryIntent();
}

class FinanceBalanceIntent extends FinanceUserIntent {
  const FinanceBalanceIntent();
}

class FinanceClearIntent extends FinanceUserIntent {
  const FinanceClearIntent();
}

class FinanceConfirmClearIntent extends FinanceUserIntent {
  const FinanceConfirmClearIntent();
}

class FinanceHelpIntent extends FinanceUserIntent {
  const FinanceHelpIntent();
}

class FinanceInvalidIntent extends FinanceUserIntent {
  const FinanceInvalidIntent(this.message);

  final String message;
}
