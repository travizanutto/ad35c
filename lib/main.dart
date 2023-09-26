import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/controllers/card_controller.dart';
import 'package:vwalltet/pages/home_page.dart';

void main() {
  Get.put(CardController());
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
