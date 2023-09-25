import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:vwalltet/controllers/card_controller.dart';
import 'package:vwalltet/pages/home_page.dart';
import 'package:vwalltet/repositories/card_repository.dart';

Widget cardListView() {
  final cardList = CardController().cardList;
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  return ListView.separated(
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        leading: SizedBox(
            width: 40,
            height: 40,
            child: SvgPicture.asset('assets/icons/mastercard_logo.svg')),
        title: Text(cardList[index].alias),
        trailing: SizedBox(
          width: 150,
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                //↓
                '↓${currencyFormat.format(cardList[index].incoming)}',
                style: TextStyle(color: Colors.green),
              ),
              Text(' | '),
              Text(
                //
                '↑${currencyFormat.format(cardList[index].expense)}',
                style: TextStyle(color: Colors.red),
              ),
            ],
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
    itemCount: cardList.length,
  );
}
