import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TileListView extends StatelessWidget {
  final Transaction tx;
  final Function DeleteTransaction;

  TileListView(this.tx, this.DeleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      elevation: 5,
      child: ListTile(
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
        subtitle: Text(
          DateFormat.yMMMd().format(tx.date),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => DeleteTransaction(tx.id),
        ),
      ),
    );
  }
}
