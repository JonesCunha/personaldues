// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:personalduestwo/models/transaction.dart';


class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final _transactions = [
    Transaction(id: 't1', tittle: 'Novo Tenis Corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: 't2', tittle: 'Conta de luz', value: 211.30, date: DateTime.now()),
    Transaction(id: 't3', tittle: 'Conta de Agua', value: 100.30, date: DateTime.now()),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
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
          Column(
            //redundante, padrao de baixo já é assim.
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ..._transactions.map((e) => Card(child: Text(e.tittle),)).toList(),
            ]
          ),
          ElevatedButton(
            onPressed: () => {},
            child: Text('Botao'),
          )
        ],
      ),
    );
  }
}
