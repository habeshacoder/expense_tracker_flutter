// ignore_for_file: prefer_const_constructors, unused_field, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:myflutterapp/widget/transaction_item.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  // ignore: prefer_const_constructors_in_immutables
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'no tranasction added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return TransactionItem(
                    transaction: transactions[index],
                    deleteTransaction: deleteTransaction);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
