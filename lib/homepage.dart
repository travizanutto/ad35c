import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomColor {
  static const gunmetal = 0xff183642;
  static const delftBlue = 0xff313d5a;
  static const pompAndPower = 0xff73628a;
  static const periwinkle = 0xffcbc5ea;
  // ignore: constant_identifier_names
  static const EASports = 0xffeaeaea;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: const Row(),
      backgroundColor: const Color(CustomColor.periwinkle),
    );
  }
}

Row myRow() {
  return Row(
    children: [
      const Text(
        'Seus cartões',
        style: TextStyle(
            fontFamily: 'Metrophobic',
            fontSize: 24,
            color: Color(CustomColor.gunmetal)),
      ),
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

AppBar myAppBar() {
  return AppBar(
    title: myRow(),
    centerTitle: false,
    backgroundColor: const Color(CustomColor.periwinkle),
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
