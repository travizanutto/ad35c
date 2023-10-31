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
  RxList<CardModel> get cardList => _cardList;
  set cardList(list) => cardList.value = list;
  /* incoming e expense sera requisitado e gravado ao banco posteriomente
  por enquanto hard coded 
  get cardIncoming => ...;
  get cardExpense => ...;
  void addTransaction(...);
  */
  // devera fazer requisao ao banco posteriomente(*talvez*)
  initCardList() {
  }
}
