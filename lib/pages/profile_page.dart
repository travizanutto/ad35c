import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/controllers/profile_controller.dart';
import 'package:vwalltet/pages/home_page.dart';
import 'package:vwalltet/pages/login_page.dart';
import 'package:vwalltet/services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController controller = Get.find<ProfileController>();

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
            icon: Icon(Icons.logout,
            color: Colors.white,
          ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: GestureDetector(
              onTap: () async {
                await ProfileController.pickImage();
              },
              child: Obx(() {
                return Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: controller.user.image!.image,
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Center(
              child: Text(
                controller.user.email,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
