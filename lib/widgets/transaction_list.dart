import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './card_list.dart';
import './tile_list_view.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...transactions.map((tx) {
          //return CardList(tx);
          return TileListView(tx, deleteTransaction);
        }).toList(),
      ],
    );
  }
}
