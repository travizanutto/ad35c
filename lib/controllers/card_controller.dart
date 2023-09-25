import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/repositories/card_repository.dart';

class CardController {
  List<CardModel> _cardList;
  CardController() : _cardList = CardRepository().list;

  get cardList => _cardList;
}
