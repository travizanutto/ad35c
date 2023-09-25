import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vwalltet/pages/card_mang_page.dart';
import 'package:vwalltet/repositories/card_repository.dart';
import 'package:vwalltet/widgets/card_list_view.dart';
import 'package:vwalltet/widgets/home_page_widgets.dart';
import 'profile_page.dart';
import '../models/profile_model.dart';

class CustomColor {
  static const gunmetal = 0xff183642;
  static const delftBlue = 0xff313d5a;
  static const pompAndPower = 0xff73628a;
  static const periwinkle = 0xffcbc5ea;
  static const EASports = 0xffeaeaea;
}

ProfileModel userProfile = ProfileModel(
  id: 'userId',
  username: 'NomeDeUsuario',
  email: 'usuario@example.com',
  phoneNumber: '(123) 456-7890',
  bio: 'Descrição do usuário',
  profileImageUrl: 'assets/profile_image.jpg',
);

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    build(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: cardListView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(CardManagerPage());
        },
        label: Text(
          'ADICIONAR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(CustomColor.delftBlue),
      ),
    );
  }
}
