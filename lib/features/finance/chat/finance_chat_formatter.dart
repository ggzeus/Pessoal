import 'package:intl/intl.dart';

import 'finance_chat_models.dart';

class FinanceChatFormatter {
  FinanceChatFormatter()
    : _currency = NumberFormat.currency(locale: 'pt_BR', symbol: r'R$'),
      _historyDate = DateFormat('dd/MM/yyyy HH:mm', 'pt_BR');

  final NumberFormat _currency;
  final DateFormat _historyDate;

  String welcomeMessage(FinanceOverview overview) {
    final balance = _currency.format(overview.balance);
    if (overview.movementCount == 0) {
      return 'Oi! Eu posso registrar suas entradas e saidas por mensagem.\n\n'
          "Experimente escrever algo como 'recebi 1500 do salario' ou 'gastei 35 no mercado'.\n"
          'Use /help para ver os comandos disponiveis.';
    }

    return 'Oi! Seu saldo atual esta em $balance.\n\n'
        "Mande uma mensagem como 'paguei 120 de internet' ou use /historico para ver os ultimos registros.";
  }

  String formatRegisteredMovement(FinanceRegisterMovementIntent intent) {
    final typeLabel = intent.type.label;
    final amount = _currency.format(intent.amount);
    final categoryLine = intent.categoryName == null
        ? ''
        : '\nCategoria: ${intent.categoryName}';

    if (intent.compactResponse) {
      return '✅ $typeLabel registrada: $amount - ${intent.description}';
    }

    return '✅ Registrado!\n'
        '$typeLabel: $amount\n'
        'Descricao: ${intent.description}$categoryLine';
  }

  String formatHistory(
    FinanceOverview overview,
    List<FinanceTransactionView> transactions,
  ) {
    final buffer = StringBuffer('📊 Historico financeiro:\n');

    if (transactions.isEmpty) {
      buffer
        ..writeln()
        ..writeln('Nenhuma movimentacao registrada ainda.')
        ..writeln()
        ..write(_totalsBlock(overview));
      return buffer.toString();
    }

    for (final item in transactions) {
      buffer.writeln(
        '${item.type.historyIcon} ${item.type.label} - ${_currency.format(item.amount)} - '
        '${item.description} - ${_historyDate.format(item.createdAt)}',
      );
    }

    buffer
      ..writeln()
      ..write(_totalsBlock(overview));
    return buffer.toString().trimRight();
  }

  String formatBalance(FinanceOverview overview) {
    return '💰 Saldo atual: ${_currency.format(overview.balance)}\n'
        'Entradas: ${_currency.format(overview.totalIncome)}\n'
        'Saidas: ${_currency.format(overview.totalExpense)}';
  }

  String helpMessage() {
    return '🤖 Comandos disponiveis:\n\n'
        '/add valor descricao - adiciona uma entrada\n'
        '/historico - mostra entradas e saidas\n'
        '/saldo - mostra saldo atual\n'
        '/limpar - limpa o historico\n'
        '/help - mostra ajuda';
  }

  String clearConfirmationMessage() {
    return '⚠️ Isso vai apagar o historico de entradas e saidas.\n'
        "Responda 'sim' para confirmar ou mande qualquer nova movimentacao para continuar.";
  }

  String clearSuccessMessage() {
    return '🧹 Historico financeiro limpo com sucesso.';
  }

  String genericErrorMessage() {
    return 'Tive um problema para processar sua mensagem agora. Tente novamente em instantes.';
  }

  String _totalsBlock(FinanceOverview overview) {
    return 'Total de entradas: ${_currency.format(overview.totalIncome)}\n'
        'Total de saidas: ${_currency.format(overview.totalExpense)}\n'
        'Saldo atual: ${_currency.format(overview.balance)}';
  }
}
