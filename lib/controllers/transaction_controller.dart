import 'package:vwalltet/models/transaction_model.dart';

class TransactionController {
  late List<TransactionModel> transactionList;

  TransactionController() {
    transactionList = [
      TransactionModel(
          name: "Teste", description: "01", price: 0.00, date: DateTime.now()),
    ];
  }
}
