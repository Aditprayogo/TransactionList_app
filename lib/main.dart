import 'dart:io';

import 'package:flutter/cupertino.dart';
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
    return Platform.isIOS
        ? CupertinoApp(
            title: 'Transaction List',
            home: MyHomePage(),
            theme: CupertinoThemeData(
              primaryColor: Colors.red,
            ),
            color: Colors.blueAccent,
            debugShowCheckedModeBanner: false,
          )
        : MaterialApp(
            title: 'Transaction List',
            home: MyHomePage(),
            theme: ThemeData(
              // Most important things
              primarySwatch: Colors.red,
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

  bool _showChart = false;
  bool isScrollControlled = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime choosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: choosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    // Modal
    showModalBottomSheet(
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            child: NewTrasaction(_addNewTransaction),
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
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
    );

    final txListWidget = Container(
      child: TransactionList(
        _userTransactions,
        _deleteTransaction,
      ),
    );

    return Scaffold(
      appBar: appBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandScape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Show Card'),
                  Switch.adaptive(
                    activeColor: Theme.of(context).primaryColor,
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  )
                ],
              ),
            if (isLandScape)
              _showChart
                  // Jika di switch menjadi true
                  ? Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: Chart(_recentTransactions),
                        ),
                        Container(
                          child: TransactionList(
                            _userTransactions,
                            _deleteTransaction,
                          ),
                        ),
                      ],
                    )
                  // end column
                  : txListWidget,
            if (!isLandScape)
              Container(
                width: double.infinity,
                child: Chart(_recentTransactions),
              ),
            if (!isLandScape) txListWidget,
          ],
        ),
      ),
    );
  }
}
