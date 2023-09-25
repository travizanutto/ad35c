enum Issuer { unknown, visa, mastercard }

class CardModel {
  String cardholderName;
  String alias;
  String cardNumber;
  String cvc;
  Issuer issuer;
  DateTime expDate;
  double incoming;
  double expense;

  CardModel(
      {required this.cardholderName,
      required this.alias,
      required this.cardNumber,
      required this.cvc,
      required this.issuer,
      required this.expDate})
      : incoming = 0, expense = 0;
}
