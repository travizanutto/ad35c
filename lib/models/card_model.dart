import 'package:vwalltet/models/transaction_model.dart';

enum Issuer { unknown, visa, mastercard }

class CardModel {
  final String cardholderName;
  String alias;
  final String cardNumber;
  final String cvc;
  final Issuer issuer;
  final String expDate;
  double incoming;
  double expense;
  List<TransactionModel> transactionList;

  CardModel(
      {required this.cardholderName,
      required this.alias,
      required this.cardNumber,
      required this.cvc,
      required this.issuer,
      required this.expDate,})
      : incoming = 0,
      expense = 0, 
      transactionList = [];
}
