import 'package:vwalltet/models/transaction.dart';

class TransactionController {
  late List<Transaction> transactionList;

  TransactionController() {
    transactionList = [
      Transaction(
          name: "Teste", description: "01", price: 0.00, date: DateTime.now()),
    ];
  }
}
