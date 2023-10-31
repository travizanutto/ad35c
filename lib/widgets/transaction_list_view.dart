import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vwalltet/controllers/card_controller.dart';
import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/pages/home_page.dart';
import 'package:vwalltet/pages/transaction_edit_page.dart';

class TransactionListView extends StatelessWidget {
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  final int cardIndex;

  TransactionListView({super.key, required this.cardIndex});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CardController());
    return Obx(() {
      return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final CardModel card = controller.cardList[cardIndex];
          final transaction = card.transactionList[index];
          return ListTile(
              leading: const SizedBox(
                width: 40,
                height: 40,
                child: Icon(Icons.attach_money),
              ),
              title: Text(transaction.name),
              subtitle: Text(transaction.description),
              trailing: Text(
                currencyFormat.format(transaction.price.abs()),
                style: transaction.price.abs() != transaction.price
                    ? const TextStyle(color: Colors.red)
                    : const TextStyle(color: Colors.green),
              ),
              onTap: () => Get.to(
                    () => TransactionEditPage(
                        cardIndex: cardIndex, transactionIndex: index),
                  ));
        },
        separatorBuilder: (_, __) => const Divider(
          indent: 16,
          endIndent: 16,
          thickness: 1,
          color: Color(CustomColor.delftBlue),
        ),
        itemCount: controller.cardList[cardIndex].transactionList.length,
      );
    });
  }
}
