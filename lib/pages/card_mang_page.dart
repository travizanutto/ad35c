import 'package:flutter/material.dart';
import 'package:vwalltet/pages/home_page.dart';

class CardManagerPage extends StatefulWidget {
  const CardManagerPage({super.key});

  @override
  State<CardManagerPage> createState() => _CardManagerPageState();
}

class _CardManagerPageState extends State<CardManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color(CustomColor.delftBlue),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('SALVAR'),
        backgroundColor: Color(CustomColor.delftBlue),
      ),
    );
  }
}

