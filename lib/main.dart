import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './models/transaction.dart';

import './widgets/transaction_list.dart';

import './widgets/new_transaction.dart';

import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction List',
      home: MyHomePage(),
      theme: ThemeData(
        // Most important things
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        // Default FOnt family
        fontFamily: 'QuickSand',
        // Text THeme
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 18,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
              ),
            ),
        // App bar theme
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      color: Colors.blueAccent,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String textAmount;

  // build in flutter mechanism
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 'a1',
    //   title: 'Pembelian Jaket Flutter',
    //   amount: 12.5,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'a2',
    //   title: 'Beli Course Vue',
    //   amount: 13.5,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
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

  void _startAddNewTransaction(BuildContext ctx) {
    // Modal
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTrasaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction List',
          style: TextStyle(
            fontFamily: 'Open Sans',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Cart
            Container(
              width: double.infinity,
              child: Chart(_recentTransactions),
            ),
            // end cart
            // User Transaction card
            TransactionList(_userTransactions),
          ],
        ),
      ),
    );
  }
}
