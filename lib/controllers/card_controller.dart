import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/repositories/card_repository.dart';
import 'package:get/get.dart';

class CardController extends GetxController {
  final CardRepository repository = CardRepository();

  @override
  void onInit() {
    initCardList();
    super.onInit();
  }

  final _cardList = <CardModel>[].obs;
  get cardList => _cardList;
  set cardList(list) => cardList.value = list;

  // devera fazer requisao ao banco posteriomente(*talvez*)
  initCardList() {
    cardList = repository.list;
  }
}
