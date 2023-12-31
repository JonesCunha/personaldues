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

  bool _showGraph = false;
  bool _showList = false;

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
        // useSafeArea: true,
        context: context,
        // isScrollControlled: true,
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
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('build() _MyHomePageState');

    bool isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(fontSize: 20 * MediaQuery.of(context).textScaleFactor),
      ),
      actions: [
        IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: Icon(Icons.add)),
        IconButton(onPressed: () => 
        setState(() {
          _showGraph = !_showGraph;
        }), 
        
        icon: Icon(_showGraph ? Icons.list : Icons.pie_chart))

      ],
    );
    final avaliableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    //print(avaliableHeight);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: appBar,
      body: Column(
        //A coluna tem o eixo main na vertical e a cross na horizontal,
        //Já as rows é invertido, as sintaes abaixo.
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: avaliableHeight * 0.05,
            child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Exibir Grafico?'),
                Switch(
                    value: _showGraph,
                    onChanged: (value) {
                      setState(() {
                        _showGraph = value;
                      });
                    }),
                Text('Exibir Lista?'),
                Switch(
                    value: _showList,
                    onChanged: (value) {
                      setState(() {
                        _showList = value;
                      });
                    }),
              ],
            ),
          ),
          if (_showGraph )
          if ( !isLandScape ) 
            Container(
              height: avaliableHeight * 0.30,
              child: Chart(
                recentTransaction: _transactions,
              ),
            ),
            if(_showList)
            Column(children: [
              Container(
                height: avaliableHeight * 0.65,
                child: TransactionList(
                transactions: _transactions,
                onRemove: _deleteTransaction,
              ),
            ),
            //TransactionForm(onSubmit: _addTransaction)
          ])
        ],
      ),
    );
  }
}
