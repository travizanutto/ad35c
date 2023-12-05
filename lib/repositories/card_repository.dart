import 'package:get/get.dart';
import 'package:vwalltet/controllers/card_controller.dart';
import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/controllers/profile_controller.dart';
import 'package:vwalltet/models/transaction_model.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardRepository {
  final _cardList = <CardModel>[].obs;
  RxList<CardModel> get cardList => _cardList;
  set cardList(list) => cardList.value = list;
  final controller = CardController();

  final db = FirebaseFirestore.instance;

  addCard(CardModel tmp) {
    final profileController = Get.put(ProfileController());
    db
      .collection("cards")
      .doc(tmp.alias)
      .set(tmp.toMap())
      .onError((e, _) => print("Erro ao cadastrar cartão: $e"));
  }

  Future<void> getCards() async {
    final profileController = Get.put(ProfileController());
    final uid = profileController.user.id;
    final cards = await db.collection("cards").get();
    cards.docs.forEach((element) {
      final card = CardModel(
        cardholderName: element["cardholderName"],
        alias: element["alias"],
        cardNumber: element["cardNumber"],
        cvc: element["cvc"],
        expDate: element["expDate"],
        transactionList:[]
      );
      _cardList.add(card);
    });
  }

  Future<void> deleteCard(String alias) async {
    final profileController = Get.put(ProfileController());
    final uid = profileController.user.id;
    await db.collection("cards").doc(alias).delete();
    _cardList.removeWhere((element) => element.alias == alias);
  }

  Future<void> updateCard(CardModel card) async {
    final profileController = Get.put(ProfileController());
    final uid = profileController.user.id;
    await db.collection("cards").doc(card.alias).update(card.toMap());
    _cardList.removeWhere((element) => element.alias == card.alias);
    _cardList.add(card);
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    final profileController = Get.put(ProfileController());
    final uid = profileController.user.id;
    await db.collection("cards").doc(transaction.cardAlias).collection("transactions").doc().set(transaction.toMap());
  }
}
