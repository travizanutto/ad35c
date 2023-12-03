import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/services/auth_service.dart';

class CardController {
  late final String uid;
  late final int cardNumber;
  late final List<CardModel> cardsIndexList;
  static final CardController _instance = CardController();

  CardController() {
    uid = AuthService.user!.uid;
  }

  List<CardModel> initCardList() {
    return [];
  }

  static get instance => _instance;
}
