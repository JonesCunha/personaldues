import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personalduestwo/components/transaction_form.dart';
import 'package:personalduestwo/components/transaction_list.dart';

import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  
  final _transactions = [
    Transaction(
        id: 't1',
        tittle: 'Novo Tenis Corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
        id: 't2', tittle: 'Conta de luz', value: 211.30, date: DateTime.now()),
    Transaction(
        id: 't3', tittle: 'Conta de Agua', value: 100.30, date: DateTime.now()),
    Transaction(
        id: 't4', tittle: 'Conta de Agua', value: 100.30, date: DateTime.now()),
    Transaction(
        id: 't5', tittle: 'Conta de Agua', value: 100.30, date: DateTime.now()),
    Transaction(
        id: 't6', tittle: 'Conta de Agua', value: 100.30, date: DateTime.now()),
  ];

  _addTransaction(String title, double value){
    final newTransaction = Transaction(id: Random().nextDouble().toString(), 
    tittle: title, value: value, date: DateTime.now());
    setState(() {
      _transactions.add(newTransaction);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: _transactions),
        TransactionForm(onSubmit: _addTransaction)
      ]
    );
  }
}