import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class NewTrasaction extends StatefulWidget {
  final Function addTx;

  // FUnction untuk menambah data
  NewTrasaction(this.addTx);

  @override
  _NewTrasactionState createState() => _NewTrasactionState();
}

class _NewTrasactionState extends State<NewTrasaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedData;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedData == null) {
      // return berarti memberhentikan sebuah function
      return;
    }

    // Sepcial property from flutter
    // to access the properties of widget inside state class
    // widget
    widget.addTx(enteredTitle, enteredAmount, _selectedData);

    // pop untuk close display screen
    // context adalah special property that can give you access in class itself
    // setelah di submit
    Navigator.of(context).pop();
  }
  // end submit data

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(3000),

      //then is a method is executed when the user choose a value/pick a date
    ).then((pickedData) {
      if (pickedData == null) {
        return;
      }

      setState(() {
        _selectedData = pickedData;
      });
    });
  }
  // end present date picker

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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            // Choosen date
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedData == null
                          ? 'No Date Choosen'
                          : 'Picked Date : ${DateFormat.yMMMd().format(_selectedData)}',
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'Choosen Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            // BUtton add transaction
            Container(
              padding: EdgeInsets.all(10),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: _submitData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
