import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/controllers/profile_controller.dart';
import 'package:vwalltet/pages/card_form_page.dart';
import 'package:vwalltet/services/auth_service.dart';
import 'package:vwalltet/widgets/card_list_view.dart';
import 'package:vwalltet/widgets/home_page_widgets.dart';

class CustomColor {
  static const gunmetal = 0xff183642;
  static const delftBlue = 0xff313d5a;
  static const pompAndPower = 0xff73628a;
  static const periwinkle = 0xffcbc5ea;
  static const eASports = 0xffeaeaea;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    build(context);
    super.initState();
    Get.put(ProfileController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: CardListView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => CardFormPage(), fullscreenDialog: true);
        },
        label: const Icon(Icons.add_card),
        backgroundColor: const Color(CustomColor.delftBlue),
      ),
    );
  }
}
