import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vwalltet/pages/transaction_controller.dart';
import 'package:vwalltet/repositories/card_repository.dart';
import 'profile_page.dart';
import '../models/profile.dart';


class CustomColor {
  static const gunmetal = 0xff183642;
  static const delftBlue = 0xff313d5a;
  static const pompAndPower = 0xff73628a;
  static const periwinkle = 0xffcbc5ea;
  static const EASports = 0xffeaeaea;
}

UserProfile userProfile = UserProfile(
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
  var transactionController = TransactionController();
  final cardList = CardRepository.list;

  @override
  void initState() {
    build(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: SizedBox(
                  width: 40,
                  height: 40,
                  child: SvgPicture.asset('assets/icons/mastercard_logo.svg')),
              title: Text(cardList[index].alias),
              trailing: Text('↓\$${cardList[index].incoming} | ↑\$${cardList[index].expense}'),
            );
          },
          padding: EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: cardList.length),
    );
  }
}

Row appBarTitle() {
  return Row(
    children: [
      const Text('Seus cartões',
          style: TextStyle(
            fontFamily: 'Metrophobic',
            fontSize: 24,
            color: Color(CustomColor.EASports),
          )),
      Padding(
        padding: const EdgeInsets.only(left: 2, top: 7),
        child: SizedBox(
            height: 8.0,
            width: 8.0,
            child: SvgPicture.asset('assets/icons/down_arrow.svg')),
      )
    ],
  );
}

AppBar homePageAppBar(BuildContext context) {
  return AppBar(
    title: appBarTitle(),
    centerTitle: false,
    backgroundColor: const Color(CustomColor.pompAndPower),
    actions: [
      GestureDetector(
        onTap: () {
          // Navegue para a ProfilePage quando o ícone for tocado.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(userProfile: userProfile),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 30,
          height: 30,
          child: SvgPicture.asset('assets/icons/man_pp.svg'),
        ),
      ),
    ],
    elevation: 0,
  );
}
