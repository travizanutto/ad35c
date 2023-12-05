import 'package:dice_icons/dice_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/controllers/createcard_controller.dart';
import 'package:vwalltet/controllers/card_controller.dart';
import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/pages/home_page.dart';
import 'package:vwalltet/repositories/card_repository.dart';
import 'package:vwalltet/widgets/std_form.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardFormPage extends StatelessWidget {
  CardFormPage({super.key});

  final controller = Get.put(CreateCardController());
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
          onPressed: controller.appBarOnPressed(),
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
            controller.onSavePressed();
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
