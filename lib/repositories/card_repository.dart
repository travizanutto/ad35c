import 'package:vwalltet/models/card_model.dart';

class CardRepository {
  static List<CardModel> list = [
    CardModel(
        cardholderName: 'Nome de Test',
        cardNumber: 'xxxx-xxxx-xxxx-xxxx',
        cvc: '00',
        expDate: DateTime.now(),
        alias: 'Alias Test',
        issuer: Issuer.mastercard),
    CardModel(
        cardholderName: 'Nome de Test2',
        cardNumber: 'xxxx-xxxx-xxxx-xxxx',
        cvc: '01',
        expDate: DateTime.now(),
        alias: 'Alias Test2',
        issuer: Issuer.visa),
  ];
}
