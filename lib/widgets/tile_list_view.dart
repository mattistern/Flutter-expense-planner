import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TileListView extends StatelessWidget {
  final Transaction tx;

  TileListView(this.tx);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        child: FittedBox(
          child: Text('\$${tx.amount.toStringAsFixed(2)}'),
        ),
      ),
      title: Text(
        tx.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
