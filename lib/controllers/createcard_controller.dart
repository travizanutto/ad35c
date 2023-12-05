import 'package:get/get.dart';

import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/repositories/card_repository.dart';
import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:http/http.dart' as http;

class CreateCardController {
  final cardholderName = TextEditingController();
  final alias = TextEditingController();
  final cardNumber = TextEditingController();
  final cvc = TextEditingController();
  //final issuer = DropdownMenuItem(child: child)
  final expDate = TextEditingController();
  final formKey = GlobalKey<FormState>();

  public appBarOnPressed() async {
    final repository = Get.put(CardRepository());
    final tmp = await controller.getRandomCard();
    repository.cardList.add(tmp);
    repository.cardList.refresh();
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

    return CardModel(
        cardholderName: ProfileController.user.email,
        alias: 'Random Card $randomCardNumber',
        cardNumber: json["credit_card_number"],
        cvc: json["id"].toString(),
        expDate: json["credit_card_expiry_date"]);
  }
}
