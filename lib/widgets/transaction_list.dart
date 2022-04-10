import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Shirt',
      amount: 30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Shoes',
      amount: 200,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Shoes',
      amount: 73,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Something',
      amount: 50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Phone',
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Car',
      amount: 1000,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ..._userTransactions.map((tx) {
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.yellow,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      '\$${tx.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMMd().format(tx.date),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
