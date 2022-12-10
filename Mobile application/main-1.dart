import './widgets/balance.dart';

import './widgets/add_descriptions.dart';
import 'package:flutter/material.dart';
import './models/total_income.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<TotalIncome> _transactions = [];

  void _addDescription(String des, int amt) {
    setState(() {
      _transactions.add(TotalIncome(
          title: des, creditDebitAmount: amt, date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Gelasio',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(204, 135, 203, 8),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontFamily: 'Gelasio',
              ),
            ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Transform.translate(
            offset: const Offset(-28.6, 0),
            child: const Text(
              'eWallet',
              style: TextStyle(fontFamily: 'Satisfy'),
            ),
          ),
          leading: const Icon(
            Icons.account_balance_wallet_rounded,
            color: Colors.brown,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Balance(userDetails: _transactions),
              AddDescriptions(addDescription: _addDescription),
              TransactionList(transactions: _transactions)
            ],
          ),
        ),
        //body: ,
      ),
    );
  }
}
