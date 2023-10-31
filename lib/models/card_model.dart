import 'package:vwalltet/models/transaction_model.dart';

class CardModel {
  final String cardholderName;
  String alias;
  final String cardNumber;
  final String cvc;
  final String expDate;
  List<TransactionModel> transactionList;

  CardModel({
    required this.cardholderName,
    required this.alias,
    required this.cardNumber,
    required this.cvc,
    required this.expDate,
  }) : transactionList = [];

  Map<String, dynamic> toMap() {
    return {
      "cardholderName": this.cardholderName,
      "alias": this.alias,
      "cardNumber": this.cardNumber,
      "cvc": this.cvc,
      "expDate": this.expDate,
    };
  }
}
