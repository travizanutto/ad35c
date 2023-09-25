import 'package:vwalltet/models/transaction_model.dart';

class TransactionRepository {
  final List<TransactionModel> _transactionList = [];

  get transactionList => _transactionList;
}
