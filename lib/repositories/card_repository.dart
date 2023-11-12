import 'package:get/get.dart';
import 'package:vwalltet/controllers/card_controller.dart';
import 'package:vwalltet/models/card_model.dart';

class CardRepository {
  final _cardList = <CardModel>[].obs;
  RxList<CardModel> get cardList => _cardList;
  set cardList(list) => cardList.value = list;
  final controller = CardController();
}
