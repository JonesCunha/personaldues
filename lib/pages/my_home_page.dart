// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:personalduestwo/components/chart.dart';
import 'package:personalduestwo/components/transaction_form.dart';
import '../components/transaction_list.dart';
import '../models/transaction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't0',
        tittle: 'Conta antiga N filtrada',
        value: 400,
        date: DateTime.now().subtract(Duration(days: 33))),
    Transaction(
        id: 't1',
        tittle: 'Novo Tenis Corrida',
        value: 310.76,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
      id: 't2',
      tittle: 'Conta de luz',
      value: 211.30,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 't3',
      tittle: 'Conta de Agua',
      value: 100.30,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.purple[400],
        shape: Border.all(width: 2),
        useSafeArea: true,
        context: context,
        builder: (ctx) {
          return TransactionForm(onSubmit: _addTransaction);
        });
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        tittle: title,
        value: value,
        date: date);
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    // AlertDialog(
    //   title: Text('Confirma?'),
    //   content: Text('Certeza?'),
    //   actions: [
    //     TextButton(
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //         },
    //         child: Text('Cancelar')),
    //     TextButton(
    //         onPressed: () {
    //         child: Text('Excluir')),
    //   ],
    // );
    //         },
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
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
        title: Text(
          'Despesas Pessoais',
        ),
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        //A coluna tem o eixo main na vertical e a cross na horizontal,
        //Já as rows é invertido, as sintaes abaixo.
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Chart(
            recentTransaction: _transactions,
          ),
          Column(children: [
            TransactionList(
              transactions: _transactions,
              onRemove: _deleteTransaction,
            ),
            //TransactionForm(onSubmit: _addTransaction)
          ])
        ],
      ),
    );
  }
}
