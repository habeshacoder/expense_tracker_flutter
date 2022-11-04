import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myflutterapp/model/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 6),
      elevation: 5,
      child: ListTile(
        leading: Padding(
          padding: EdgeInsets.all(4),
          child: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: FittedBox(child: Text('\$${transaction.amount}')),
            ),
          ),
        ),
        title: Text('\$${transaction.title}'),
        subtitle: Text(
          new DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: IconButton(
          onPressed: () => deleteTransaction(transaction.id),
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}
