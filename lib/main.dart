import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vwalltet/controllers/card_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vwalltet/pages/login_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(CardController());
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ),
  );
}
