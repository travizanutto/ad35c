import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: false,
        backgroundColor: const Color(CustomColor.delftBlue),
        elevation: 2,
      ),
    );
  }
}
