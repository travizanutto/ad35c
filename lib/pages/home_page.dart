import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/controllers/card_controller.dart';
import 'package:vwalltet/controllers/profile_controller.dart';
import 'package:vwalltet/pages/card_form_page.dart';
import 'package:vwalltet/repositories/card_repository.dart';
import 'package:vwalltet/widgets/card_list_view.dart';
import 'package:vwalltet/widgets/home_page_widgets.dart';

class CustomColor {
  static const gunmetal = 0xff183642;
  static const delftBlue = 0xff313d5a;
  static const pompAndPower = 0xff73628a;
  static const periwinkle = 0xffcbc5ea;
  static const eASports = 0xffeaeaea;
}

class HomePage extends StatelessWidget {

  final controller = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    Get.put(CardController());
    Get.put(CardRepository());
    Get.put(ProfileController());
    return Scaffold(
      appBar: homePageAppBar(context),
      body: CardListView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => CardFormPage(), fullscreenDialog: true);
        },
        label: const Icon(Icons.add_card, color: Colors.white,),
        backgroundColor: const Color(CustomColor.delftBlue),
      ),
    );
  }
}
