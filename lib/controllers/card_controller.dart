import 'dart:convert';
import 'package:get/get.dart';
import 'package:vwalltet/repositories/card_repository.dart';

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

  
}
