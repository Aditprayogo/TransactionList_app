import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transaction.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'a1',
      title: 'Pembelian Jaket Flutter',
      amount: 12.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'a2',
      title: 'Beli Course Vue',
      amount: 13.5,
      date: DateTime.now(),
    ),
  ];

  void _addNewTrasacntion(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // User Text Input
        NewTrasaction(_addNewTrasacntion),
        // Widget Card untuk transaction list data
        TransactionList(_userTransactions),
      ],
    );
  }
}
