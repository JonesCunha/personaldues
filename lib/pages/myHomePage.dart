// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personalduestwo/components/transaction_form.dart';

import '../components/transaction_list.dart';
import '../models/transaction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
  ];

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return TransactionForm(onSubmit: _addTransaction);
        });
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        tittle: title,
        value: value,
        date: DateTime.now());
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: [IconButton(onPressed: () => _openTransactionFormModal(context), icon: Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        child: Column(
          //A coluna tem o eixo main na vertical e a cross na horizontal,
          //Já as rows é invertido, as sintaes abaixo.
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              // width: double.infinity,
              height: 100,
              child: Card(
                elevation: 5,
                color: Colors.blue,
                child: Text('Grafico'),
              ),
            ),
            Column(children: [
              TransactionList(transactions: _transactions),
              //TransactionForm(onSubmit: _addTransaction)
            ])
          ],
        ),
      ),
    );
  }
}
