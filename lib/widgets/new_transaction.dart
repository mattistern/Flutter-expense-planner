import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _onSubmimt() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final titleEntered = _titleController.text;
    final amountEntered = double.parse(_amountController.text);

    if (titleEntered.isEmpty || amountEntered <= 0 || _selectedDate == null) {
      return;
    }

    widget.addNewTransaction(
      titleEntered,
      amountEntered,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
            onSubmitted: (_) =>
                _onSubmimt(), //we need to provide a String but we don't need it so we use '_'
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: _amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) =>
                _onSubmimt(), //we need to provide a String but we don't need it so we use '_'
          ),
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDate == null
                      ? 'No date chosen!'
                      : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                ),
                TextButton(
                  child: Text(
                    'Choose date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _presentDatePicker,
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Theme.of(context).textTheme.button.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: _onSubmimt,
            ),
          ),
        ]),
      ),
    );
  }
}
