import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/controllers/profile_controller.dart';
import 'package:vwalltet/pages/home_page.dart';
import 'package:vwalltet/pages/login_page.dart';
import 'package:vwalltet/services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final user = ProfileController.user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('vWallet'),
        centerTitle: true,
        backgroundColor: Color(CustomColor.delftBlue),
        titleTextStyle: TextStyle(
          fontFamily: 'Metrophobic',
          fontSize: 24,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AuthService().signOut();
              Get.offAll(
                () => LoginPage(),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              user.email,
              style: TextStyle(fontSize: 18),
            ),
          ),
          
        ],
      ),
    );
  }
}
