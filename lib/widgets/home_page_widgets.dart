import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vwalltet/controllers/profile_controller.dart';
import 'package:vwalltet/pages/home_page.dart';
import 'package:vwalltet/pages/profile_page.dart';

Row appBarTitle() {
  return const Row(
    children: [
      Text(
        'Seus cartões',
        style: TextStyle(
          fontFamily: 'Metrophobic',
          fontSize: 24,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    ],
  );
}

AppBar homePageAppBar(BuildContext context) {
  final user = ProfileController.user;
  return AppBar(
    title: appBarTitle(),
    centerTitle: false,
    backgroundColor: const Color(CustomColor.delftBlue),
    actions: [
      GestureDetector(
        onTap: () {
          Get.to(() => ProfilePage());
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 30,
          height: 30,
          child: user.image,
        ),
      ),
    ],
    elevation: 0,
  );
}
