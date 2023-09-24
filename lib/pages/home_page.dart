import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vwalltet/pages/transaction_controller.dart';
import 'package:vwalltet/pages/transaction_page.dart';

class CustomColor {
  static const gunmetal = 0xff183642;
  static const delftBlue = 0xff313d5a;
  static const pompAndPower = 0xff73628a;
  static const periwinkle = 0xffcbc5ea;
  // ignore: constant_identifier_names
  static const EASports = 0xffeaeaea;
}

class HomePage extends StatelessWidget {
  var transactionController = TransactionController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(),
      body: ListView.separated(
        itemCount: transactionController.transactionList.length,
        itemBuilder: (BuildContext context, int transaction) {
          final list = transactionController.transactionList;
          return ListTile(
            leading: SvgPicture.asset('assets/icons/man_pp.svg', alignment: Alignment.bottomLeft,),
            title: Text(list[transaction].name),
            trailing: Text(list[transaction].price.toString()),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TransactionPage(
                      key: Key(list[transaction].name),
                      transaction: list[transaction],
                      )
                  ));
            },
          );
        },
        separatorBuilder: (_, __) => Divider(),
        padding: EdgeInsets.all(0),
      ),
      backgroundColor: const Color(CustomColor.EASports),
    );
  }
}

Row appBarTitle() {
  return Row(
    children: [
      const Text('Seus cartões',
          style: TextStyle(
            fontFamily: 'Metrophobic',
            fontSize: 24,
            color: Color(CustomColor.EASports),
          )),
      Padding(
        padding: const EdgeInsets.only(left: 2, top: 7),
        child: SizedBox(
            height: 8.0,
            width: 8.0,
            child: SvgPicture.asset('assets/icons/down_arrow.svg')),
      )
    ],
  );
}

AppBar homePageAppBar() {
  return AppBar(
    title: appBarTitle(),
    centerTitle: false,
    backgroundColor: const Color(CustomColor.pompAndPower),
    actions: [
      Container(
        margin: const EdgeInsets.all(10),
        width: 30,
        height: 30,
        child: SvgPicture.asset('assets/icons/man_pp.svg'),
      ),
    ],
    elevation: 0,
  );
}
