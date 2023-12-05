import 'package:dice_icons/dice_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/controllers/card_controller.dart';
import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/pages/home_page.dart';
import 'package:vwalltet/repositories/card_repository.dart';
import 'package:vwalltet/widgets/std_form.dart';

class CardFormPage extends StatelessWidget {
  CardFormPage({super.key});

  final cardholderName = TextEditingController();
  final alias = TextEditingController();
  final cardNumber = TextEditingController();
  final cvc = TextEditingController();
  //final issuer = DropdownMenuItem(child: child)
  final expDate = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: const Color(CustomColor.delftBlue), actions: [
        IconButton(
          icon: Icon(
            DiceIcons.dice5,
            color: Colors.white,
          ),
          onPressed: () async {
            final controller = Get.put(CardController());
            final repository = Get.put(CardRepository());
            final tmp = await controller.getRandomCard();
            repository.cardList.add(tmp);
            repository.cardList.refresh();
            Get.back();
          },
        ),
      ]),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (formKey.currentState!.validate()) {
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
            Get.back();
          }
        },
        backgroundColor: const Color(CustomColor.delftBlue),
        label: const Text(
          'SALVAR',
          style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
