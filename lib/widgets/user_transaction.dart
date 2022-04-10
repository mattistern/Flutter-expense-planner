import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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
    return Column(
      children: [
        NewTransaction(),
        TransactionList(_userTransactions),
      ],
    );
  }
}
