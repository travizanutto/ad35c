import 'package:flutter/material.dart';

class CardManagerPage extends StatefulWidget {
  const CardManagerPage({super.key});

  @override
  State<CardManagerPage> createState() => _CardManagerPageState();
}

class _CardManagerPageState extends State<CardManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar'),),
    );
  }
}