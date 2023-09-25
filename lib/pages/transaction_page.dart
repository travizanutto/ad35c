import 'package:flutter/material.dart';
import 'package:vwalltet/pages/home_page.dart';
import '../models/transaction_model.dart';

class TransactionPage extends StatefulWidget {
  TransactionModel transaction;
  TransactionPage({required Key key, required this.transaction})
      : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(CustomColor.pompAndPower),
          title: Text(widget.transaction.name),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.stacked_line_chart),
              text: 'Informações',
            ),
            Tab(
              icon: Icon(Icons.emoji_events),
              text: 'blablabla',
            )
          ]),
        ),
      ),
    );
  }
}
