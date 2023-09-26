import 'package:vwalltet/models/card_model.dart';

class CardRepository {
  final List<CardModel> _list = [
    CardModel(
      cardholderName: 'Pessoa X',
      cardNumber: 'xxxx-xxxx-xxxx-xxxx',
      cvc: '00',
      expDate: '',
      alias: 'Debito BancoX',
      issuer: Issuer.mastercard,
    ),
  ];
  List<CardModel> get list => _list;
}
