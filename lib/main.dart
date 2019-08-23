import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLutter App',
      home: MyHomePage(),
      color: Colors.orangeAccent,
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Tell dart of transaction will hold value of Transaction
  final List<Transaction> transaction = [
    Transaction(
      id: 'a1',
      title: 'Kontol Ayam',
      amount: 99.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'a2',
      title: 'Kontol babi',
      amount: 99.99,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
            child: Card(
              color: Colors.greenAccent,
              child: Text(
                'CHART!',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // map transform to list of objct to list of widgets
          Column(
            children: transaction.map(
              (tx) {
                return Card(
                  child: Text(tx.title),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
