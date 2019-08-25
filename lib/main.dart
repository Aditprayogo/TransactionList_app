import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './models/transaction.dart';

import './widgets/user_transaction.dart';

import './widgets/new_transaction.dart';

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
  // String titleInput;
  // String textAmount;

  // build in flutter mechanism
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
          backgroundColor: Colors.orangeAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Cart
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.greenAccent,
                  elevation: 10,
                  child: Text(
                    'CHART!',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // end cart
              UserTransactions(),
            ],
          ),
        ));
  }
}
