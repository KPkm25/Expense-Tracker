import 'package:ewallet/models/total_income.dart';
import 'package:flutter/material.dart';

class Balance extends StatelessWidget {
  final List<TotalIncome> userDetails;
  const Balance({super.key, required this.userDetails});

  int get incomes {
    int sum = 0;
    for (int i = 0; i < userDetails.length; i++) {
      if (userDetails[i].creditDebitAmount > 0) {
        sum += userDetails[i].creditDebitAmount;
      }
    }
    return sum;
  }

  int get expenses {
    int sum = 0;
    for (int i = 0; i < userDetails.length; i++) {
      if (userDetails[i].creditDebitAmount < 0) {
        sum += userDetails[i].creditDebitAmount;
      }
    }
    return sum;
  }

  int get totalBalance {
    int sum = 0;
    for (int i = 0; i < userDetails.length; i++) {
      sum += userDetails[i].creditDebitAmount;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        color: (totalBalance >= 0) ? Colors.green : Colors.red,
        height: 150,
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 25, left: 20),
              height: 55,
              width: 70,
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  Text(
                    '₹$incomes',
                    style: const TextStyle(
                      color: Colors.green,
                      fontFamily: 'Gelasio',
                    ),
                  ),
                  const Text(
                    'Incomes',
                    style: TextStyle(
                      fontFamily: 'Gelasio',
                      color: Color.fromARGB(255, 119, 118, 118),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.only(bottom: 45, right: 20, left: 15),
              child: Column(
                children: [
                  const Text(
                    'Total Balance',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gelasio',
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    (totalBalance < 0)
                        ? '-₹${totalBalance.abs()}'
                        : '₹$totalBalance',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gelasio',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 55,
              width: 70,
              padding: const EdgeInsets.only(top: 5),
              margin: const EdgeInsets.only(right: 18, top: 25),
              child: Column(
                children: [
                  Text(
                    (expenses < 0) ? '-₹${expenses.abs()}' : '0',
                    style: const TextStyle(
                      color: Colors.red,
                      fontFamily: 'Gelasio',
                    ),
                  ),
                  const Text(
                    'Expenses',
                    style: TextStyle(
                      fontFamily: 'Gelasio',
                      color: Color.fromARGB(255, 119, 118, 118),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
