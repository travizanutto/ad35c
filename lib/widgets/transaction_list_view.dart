import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vwalltet/controllers/card_controller.dart';
import 'package:vwalltet/models/card_model.dart';
import 'package:vwalltet/pages/home_page.dart';
import 'package:vwalltet/pages/transaction_form_page.dart';

class TransactionListView extends StatelessWidget {
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  final controller = Get.find<CardController>();
  final int cardIndex;

  TransactionListView({super.key, required this.cardIndex});

  @override
  Widget build(BuildContext context) {
    final CardModel card = controller.cardList[cardIndex];
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
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
                  TransactionFormPage(),
                ));
      },
      separatorBuilder: (_, __) => const Divider(
        indent: 16,
        endIndent: 16,
        thickness: 1,
        color: Color(CustomColor.delftBlue),
      ),
      itemCount: card.transactionList.length,
    );
  }
}
