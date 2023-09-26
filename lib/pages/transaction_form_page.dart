import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/controllers/card_controller.dart';
import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/pages/home_page.dart';
import 'package:vwalltet/widgets/std_form.dart';

class TransactionFormPage extends StatelessWidget {
  TransactionFormPage({super.key});

  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final description = TextEditingController();
  final price = TextEditingController();
  final date = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  controller: name,
                  decoration: stdInputDecoration('Nome da transação'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'A transação precisa de um nome.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: description,
                  decoration: stdInputDecoration('Descrição'),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: context.width / 2 - 16,
                      child: TextFormField(
                        controller: price,
                        decoration: stdInputDecoration('Preço'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Preço inválido.';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: context.width / 2 - 16,
                      child: TextFormField(
                        controller: date,
                        decoration: stdInputDecoration('Data da transação'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Data inválida.';
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
            final controller = Get.put(CardController());
            controller.cardList.refresh();
            Get.back();
          }
        },
        backgroundColor: const Color(CustomColor.delftBlue),
        label: const Text(
          'SALVAR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
