import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/transaction.dart';

import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: EdgeInsets.all(10),
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Text(
                    'No Transaction added yet',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/waiting.png',
                    width: 70,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return TransactionItem(
                  transaction: transactions[index],
                  deleteTx: deleteTx,
                );
              },
            ),
    );
  }
}
