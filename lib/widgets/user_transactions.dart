import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import 'dart:math';

class UserTransactions extends StatefulWidget {
  final Function _deleteTransaction;

  UserTransactions(this._deleteTransaction);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  
  final List<Transaction> _transactions = [
    Transaction(
      id: '1000',
      title: 'Book',
      amount: 23.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '1001',
      title: 'Ganes',
      amount: 59.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    print('Adding $title and $amount');
    final tx = Transaction(
      id: '${Random().nextInt(1000)}',
      title: title,
      amount: amount,
      date: chosenDate,
    );

    setState(() {
      _transactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_transactions, null),
      ],
    );
  }
}
