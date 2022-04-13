import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactionList;

  Chart(this.transactionList);

  List<Map<String, Object>> get transactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < transactionList.length; i++) {
        if (transactionList[i].date.year == weekDay.year &&
            transactionList[i].date.month == weekDay.month &&
            transactionList[i].date.day == weekDay.day) {
          totalSum += transactionList[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpendings {
    return transactionsValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: transactionsValues.map((data) {
            return Flexible(
              //fit: FlexFit.tight,
              child: ChartBar(
                lable: data['day'],
                spendingAmount: data['amount'],
                spendingPctOfTotle: totalSpendings == 0
                    ? 0
                    : (data['amount'] as double) / totalSpendings,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
