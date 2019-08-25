import 'package:flutter/material.dart';

class NewTrasaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTrasaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    // Text Input
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              maxLength: 5,
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
                onPressed: () {
                  addTx(
                    titleController.text,
                    double.parse(amountController.text),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
