import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/pages/home_page.dart';
import 'package:vwalltet/pages/transaction_form_page.dart';
import 'package:vwalltet/widgets/transaction_list_view.dart';

class CardManagePage extends StatelessWidget {
  const CardManagePage({super.key, required this.cardIndex});
  final int cardIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(CustomColor.delftBlue),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: TransactionListView(
            cardIndex: cardIndex,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(
          () => TransactionFormPage(
            cardIndex: cardIndex,
          ),
        ),
        backgroundColor: const Color(CustomColor.delftBlue),
        label: const Icon(Icons.add,
            color: Colors.white,
          ),
      ),
    );
  }
}
