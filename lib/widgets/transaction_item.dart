import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FittedBox(
              child: Text('\$${transaction.amount}'),
            ),
          ),
        ),
        // midle element
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        // ngasih space untuk title
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
              )
            : IconButton(
                color: Theme.of(context).primaryColor,
                icon: Icon(Icons.delete),
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
  }
}
