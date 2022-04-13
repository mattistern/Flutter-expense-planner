import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './card_list.dart';
import './tile_list_view.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...transactions.map((tx) {
          //return CardList(tx);
          return TileListView(tx);
        }).toList(),
      ],
    );
  }
}
