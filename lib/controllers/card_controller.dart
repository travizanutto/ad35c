import 'dart:convert';

import 'package:get/get.dart';
import 'package:vwalltet/controllers/profile_controller.dart';
import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/services/auth_service.dart';

import 'package:http/http.dart' as http;

class CardController {
  late final String uid;
  late final int cardNumber;
  late final List<CardModel> cardsIndexList;
  static final CardController _instance = CardController();
  static var randomCardNumber = 0;

  CardController() {
    uid = AuthService.user!.uid;
  }

  List<CardModel> initCardList() {
    return [];
  }

  static get instance => _instance;

  Future<CardModel> getRandomCard() async {
    final url = Uri.https('random-data-api.com', 'api/v2/credit_cards');
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    randomCardNumber++;

    final controller = Get.put(ProfileController());

    return CardModel(
        cardholderName: controller.user.email,
        alias: 'Random Card $randomCardNumber',
        cardNumber: json["credit_card_number"],
        cvc: json["id"].toString(),
        expDate: json["credit_card_expiry_date"]);
  }
}
