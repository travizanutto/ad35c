import 'package:get/get.dart';

import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/repositories/card_repository.dart';
import 'package:vwalltet/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

// Import the firebase_core and cloud_firestore plugin

import 'package:http/http.dart' as http;

class CreateCardController {
  final cardholderName = TextEditingController();
  final alias = TextEditingController();
  final cardNumber = TextEditingController();
  final cvc = TextEditingController();
  //final issuer = DropdownMenuItem(child: child)
  final expDate = TextEditingController();
  final formKey = GlobalKey<FormState>();

  int randomCardNumber = 0;

  appBarOnPressed() async {
    final repository = Get.put(CardRepository());
    final tmp = await getRandomCard();
    repository.addCard(tmp);
    repository.getCards();
    Get.back();
  }

  onSavePressed() {
    final repository = Get.put(CardRepository());
    repository.cardList.add(
      CardModel(
        cardholderName: cardholderName.text,
        cardNumber: cardNumber.text,
        cvc: cvc.text,
        expDate: expDate.text,
        alias: alias.text,
      ),
    );
    repository.cardList.refresh();
  }

  Future<CardModel> getRandomCard() async {
    var url = Uri.https('random-data-api.com', 'api/v2/credit_cards');
    var response = await http.get(url);
    final json = jsonDecode(response.body);
    randomCardNumber++;
    final profileController = Get.put(ProfileController());
    CardModel tmp = CardModel(
        cardholderName: profileController.user.email,
        alias: 'Random Card',
        cardNumber: json["credit_card_number"],
        cvc: json["id"].toString(),
        expDate: json["credit_card_expiry_date"]);
    print("AAAAAAAAA");
    print(json);
    return tmp;
  }
}
