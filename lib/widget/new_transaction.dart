// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final textControler = TextEditingController();
  final amountController = TextEditingController();

  dynamic SelectedDate;

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = textControler.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty || SelectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      SelectedDate,
    );
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          SelectedDate = pickedDate;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              controller: textControler,
              decoration: InputDecoration(labelText: "title"),
              onSubmitted: (_) {
                submitData();
              },
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: "amount"),
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                submitData();
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 7,
              ),
              decoration: BoxDecoration(color: Colors.grey),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      SelectedDate == null
                          ? 'no date chosen '
                          : 'picked date: ${DateFormat.yMd().format(SelectedDate)}',
                    ),
                  ),
                  FlatButton(
                    onPressed: presentDatePicker,
                    child: Text('choos the date'),
                  ),
                ],
              ),
            ),
            FlatButton(
              textColor: Colors.amber[500],
              onPressed: submitData,
              child: Text("add transaction"),
            )
          ],
        ),
      ),
    );
  }
}
