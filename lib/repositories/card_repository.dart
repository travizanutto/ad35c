import 'package:vwalltet/models/card_model.dart';

class CardRepository {
  final List<CardModel> _list = [
    CardModel(
      cardholderName: 'Pessoa X',
      cardNumber: 'XXXX XXXX XXXX XXXX',
      cvc: '000',
      expDate: '00/00',
      alias: 'Debito BancoX',
      issuer: Issuer.mastercard,
    ),
  ];
  List<CardModel> get list => _list;
}
