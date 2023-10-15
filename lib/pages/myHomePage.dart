// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            child: Card(
              child: Text('Grafico'),
              elevation: 5,
              color: Colors.blue,
              
            ),
          ),
          Card(
            child: Text('Lista de transações'),
          )
        ],
      ),
    );
  }
}
