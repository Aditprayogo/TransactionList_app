import 'package:flutter/material.dart';

class NewTrasaction extends StatefulWidget {
  final Function addTx;

  NewTrasaction(this.addTx);

  @override
  _NewTrasactionState createState() => _NewTrasactionState();
}

class _NewTrasactionState extends State<NewTrasaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      // return berarti memberhentikan sebuah function
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
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
                onPressed: submitData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
