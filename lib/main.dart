import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './models/transaction.dart';

import './widgets/transaction_list.dart';

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
              // Text Input
              Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: titleController,
                        // onChanged: (value) {
                        //   titleInput = value;
                        // },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        controller: amountController,
                        // onChanged: (value) {
                        //   textAmount = value;
                        // },
                      ),
                      // BUtton add transaction
                      Container(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          color: Colors.blueAccent,
                          child: Text('Add Transaction'),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Widget Card untuk transaction list data
              TransactionList(),
            ],
          ),
        ));
  }
}
