import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void onSubmimt() {
    final titleEntered = titleController.text;
    final amountEntered = double.parse(amountController.text);

    if (titleEntered.isEmpty || amountEntered <= 0) {
      return;
    }

    widget.addNewTransaction(
      titleEntered,
      amountEntered,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_) =>
                onSubmimt(), //we need to provide a String but we don't need it so we use '_'
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) =>
                onSubmimt(), //we need to provide a String but we don't need it so we use '_'
          ),
          TextButton(
            child: Text(
              'Add Transaction',
              style: TextStyle(
                color: Colors.yellow,
              ),
            ),
            onPressed: onSubmimt,
          ),
        ]),
      ),
    );
  }
}
