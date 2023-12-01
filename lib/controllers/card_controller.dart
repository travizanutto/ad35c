import 'package:sqlite3/sqlite3.dart';
import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/services/auth_service.dart';

class CardController {
  late final String uid;
  late final int cardNumber;
  late final List<CardModel> cardsIndexList;
  late final Database db;
  static final CardController _instance = CardController();

  CardController() {
    uid = AuthService.user!.uid;
    //db = sqlite3.open('../main.db');
  }

  List<CardModel> initCardList() {
    return [];
  }

  static get instance => _instance;
}
