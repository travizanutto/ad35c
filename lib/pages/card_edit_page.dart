import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/pages/card_form_page.dart';
import 'package:vwalltet/pages/home_page.dart';
import 'package:vwalltet/models/transaction_model.dart';
import 'package:vwalltet/repositories/card_repository.dart';

import '../widgets/std_form.dart';

class CardEditPage extends CardFormPage {
  final int cardIndex;
  final repository = Get.put(CardRepository());

  CardEditPage({super.key, required this.cardIndex});

  @override
  Widget build(BuildContext context) {
    final card = repository.cardList[cardIndex];
    alias.text = card.alias;
    cardNumber.text = card.cardNumber;
    cardholderName.text = card.cardholderName;
    cvc.text = card.cvc;
    expDate.text = card.expDate;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(CustomColor.delftBlue),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: alias,
                  decoration: stdInputDecoration('Nome de exibição'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O cartão precisa de um nome.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: cardholderName,
                  decoration: stdInputDecoration('Nome do titular'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nome do titular inválido.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: cardNumber,
                  decoration: stdInputDecoration('Número do cartão'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Número inválido.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: context.width / 2 - 16,
                      child: TextFormField(
                        controller: cvc,
                        decoration: stdInputDecoration('Código CVC'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            return 'CVC inválido.';
                          }
                          return null;
                        },
                        onChanged: (String? value) {
                          if (value == null || value.isEmpty) return;
                          if (value.length > 3) {
                            cvc.text = value.substring(0, 3);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: context.width / 2 - 16,
                      child: TextFormField(
                        controller: expDate,
                        decoration: stdInputDecoration('Data de vencimento'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Data de vencimento inválida.';
                          }
                          return null;
                        },
                        /*onChanged: (String? value) {
                          if (value == null || value.isEmpty) return;
                          if (value.length <= 4) {
                            expDate.text = '${value.substring(0,1)}/ ${value.substring(2)}';
                          }
                        },*/
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          FloatingActionButton.extended(
            heroTag: "btn1",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final repository = Get.put(CardRepository());
                List<TransactionModel> transactionList =
                    repository.cardList[cardIndex].transactionList;
                repository.cardList[cardIndex] = CardModel(
                  cardholderName: cardholderName.text,
                  alias: alias.text,
                  cardNumber: cardNumber.text,
                  cvc: cvc.text,
                  expDate: expDate.text,
                );
                repository.cardList[cardIndex].transactionList =
                    transactionList;
                repository.cardList.refresh();
                Get.back();
              }
            },
            backgroundColor: const Color(CustomColor.delftBlue),
            label: const Text(
              'SALVAR',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton.extended(
            heroTag: "btn2",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final repository = Get.put(CardRepository());
                repository.cardList.removeAt(cardIndex);
                repository.cardList.refresh();
                Get.back();
              }
            },
            backgroundColor: const Color.fromARGB(200, 200, 0, 0),
            label: const Text(
              'EXCLUIR',
              style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
