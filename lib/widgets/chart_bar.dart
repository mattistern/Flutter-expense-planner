import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double spendingAmount;
  final double spendingPctOfTotle;

  ChartBar({
    this.lable,
    this.spendingAmount,
    this.spendingPctOfTotle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 15,
          width: 70,
          child: FittedBox(
            child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
            // spendingAmount == 0
            //     ? Text('\$${spendingAmount.toInt()}')
            //     : Text('\$${spendingAmount}'),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotle,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text('$lable'),
      ],
    );
  }
}
