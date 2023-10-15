// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:personalduestwo/components/transaction_user.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FloatingActionButton(
          backgroundColor: Colors.black,
          elevation: 10,
          child: Icon(Icons.add),
          onPressed: () => {}),
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
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
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}
