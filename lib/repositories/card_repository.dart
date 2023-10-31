import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/services/db_service.dart';

class CardRepository {
  addCard(CardModel card, String uuid) async {
    await DataBaseService.get().collection('cards').doc(uuid).set(card.toMap());
  }
}
