import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: false,
        backgroundColor: const Color(CustomColor.delftBlue),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                IconButton(
                    onPressed: () {
                      Get.off(() => HomePage());
                    },
                    icon: Icon(Icons.login)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
