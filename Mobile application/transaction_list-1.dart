import 'package:flutter/material.dart';
import '../models/total_income.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class TransactionList extends StatelessWidget {
  final List<TotalIncome> transactions;
  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return Container(
      margin: const EdgeInsets.only(top: 40),
      width: double.infinity,
      child: Column(
        children: transactions.map((tx) {
          return Card(
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: const TextStyle(fontFamily: 'Gelasio'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          DateFormat('d MMM, hh:mm a').format(tx.date),
                          style: const TextStyle(
                              fontFamily: 'Gelasio',
                              color: Color.fromARGB(255, 134, 134, 134)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    (tx.creditDebitAmount < 0)
                        ? '-₹${tx.creditDebitAmount.abs()}'
                        : '+₹${tx.creditDebitAmount.abs()}',
                    style: TextStyle(
                      color: ((tx.creditDebitAmount < 0)
                          ? Colors.red
                          : Colors.green),
                      fontFamily: 'Gelasio',
                    ),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
