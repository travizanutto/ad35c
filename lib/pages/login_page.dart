import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          icon: const Icon(Icons.check),
          onPressed: () {
            Get.off(
              () => const HomePage(), 
            );
          },
        ),
      ),
    );
  }
}
