import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vwalltet/controllers/card_controller.dart';
import 'package:vwalltet/pages/card_edit_page.dart';
import 'package:vwalltet/pages/card_manage_page.dart';
import 'package:vwalltet/pages/home_page.dart';

class CardListView extends StatelessWidget {
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  final controller = Get.find<CardController>();

  CardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: SizedBox(
                width: 40,
                height: 40,
                child: SvgPicture.asset('assets/icons/mastercard_logo.svg')),
            title: Text(controller.cardList[index].alias),
            trailing: const SizedBox(
              width: 150,
              height: 20,/*
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    //↓
                    '↓${currencyFormat.format(controller.cardList[index].incoming)}',
                    style: const TextStyle(color: Colors.green),
                  ),
                  const Text(' | '),
                  Text(
                    //
                    '↑${currencyFormat.format(controller.cardList[index].expense)}',
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),*/
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
        itemCount: controller.cardList.length,
      ),
    );
  }
}
