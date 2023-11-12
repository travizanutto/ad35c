import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vwalltet/pages/card_edit_page.dart';
import 'package:vwalltet/pages/card_manage_page.dart';
import 'package:vwalltet/pages/home_page.dart';
import 'package:vwalltet/repositories/card_repository.dart';

class CardListView extends StatelessWidget {
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  final repository = Get.find<CardRepository>();

  CardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const SizedBox(
              width: 40,
              height: 40,
              child: Icon(Icons.credit_card),
            ),
            title: Text(
              repository.cardList[index].alias,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              splashRadius: 20,
              onPressed: () => Get.to(
                () => CardEditPage(
                  cardIndex: index,
                ),
              ),
            ),
            onTap: () => Get.to(
              () => CardManagePage(
                cardIndex: index,
              ),
            ),
            onLongPress: () => Get.to(
              () => CardEditPage(
                cardIndex: index,
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const Divider(
          indent: 16,
          endIndent: 16,
          thickness: 1,
          color: Color(CustomColor.delftBlue),
        ),
        itemCount: repository.cardList.length,
      ),
    );
  }
}
