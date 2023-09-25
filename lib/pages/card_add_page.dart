import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/controllers/card_controller.dart';
import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/pages/home_page.dart';

class CardAddPage extends StatelessWidget {
  CardAddPage({super.key});

  final formKey = GlobalKey<FormState>();
  final cardholderName = TextEditingController();
  final alias = TextEditingController();
  final cardNumber = TextEditingController();
  final cvc = TextEditingController();
  //final issuer = DropdownMenuItem(child: child)
  final expDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: alias,
                decoration: InputDecoration(
                  labelText: 'Apelido',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(CustomColor.pompAndPower)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                validator: (String? value) {
                  if (value == null) {
                    print('Nulo');
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          formKey.currentState!.validate();
          final controller = Get.put(CardController());
          controller.cardList.value.add(
            CardModel(
              cardholderName: 'Nome de Test',
              cardNumber: 'xxxx-xxxx-xxxx-xxxx',
              cvc: '00',
              expDate: DateTime.now(),
              alias: 'Teste ${controller.cardList.value.length + 1}',
              issuer: Issuer.mastercard,
            ),
          );
          controller.cardList.refresh();
        },
        label: const Text(
          'SALVAR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
