import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomColor {
  static const gunmetal = 0xff183642;
  static const delftBlue = 0xff313d5a;
  static const pompAndPower = 0xff73628a;
  static const periwinkle = 0xffcbc5ea;
  static const EASports = 0xffeaeaea;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: saldo(),
      backgroundColor: const Color(CustomColor.gunmetal),
    );
  }


AppBar myAppBar() {
  return AppBar(
        title: const Text('vWallet'),
        centerTitle: true,
        backgroundColor: const Color(CustomColor.gunmetal),
        leading: Container(
          margin: const EdgeInsets.all(10),
          child: SvgPicture.asset('assets/icons/man_pp.svg'),
        ),
        actions: [Container(
          margin: const EdgeInsets.all(8),
          width: 30,
          height: 30,
          child: SvgPicture.asset('assets/icons/settings.svg'), 
        )],
        elevation: 0,
      );
}
  Padding saldo() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Wrap(
        direction: Axis.vertical,
        spacing: -12,
        children: [
          Text('Saldo',
            style: TextStyle(
              fontSize: 24.0, 
              color: Color(CustomColor.EASports)
              ),
            ),
          Text('R\$1000.00',
            style: TextStyle(
              fontSize: 42.0,
              color: Color(CustomColor.EASports)
              ),
            )
        ],
      ),
    );
  }
}