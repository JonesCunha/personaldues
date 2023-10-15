// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:personalduestwo/models/transaction.dart';
import 'package:intl/intl.dart';


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
      bottomNavigationBar: 
       FloatingActionButton(backgroundColor: Colors.black,
          elevation: 10,
          child: Icon(Icons.add), onPressed: ()=>{}),
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
            children: 
              _transactions.map((e) => Card(child: 
                Row(children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2)),
                    padding: EdgeInsets.all(10),
                    child: 
                      
                      //Text('R\$ ${e.value.toStringAsFixed(2)}', 
                      Text(NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(e.value),
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple 
                    ),),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.tittle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text(
                          //e.date.toString()
                          DateFormat('d/MM/y').format(e.date) 
                          ,style: TextStyle(color: Colors.grey[800]),),
                    ],
                  )
                ],)
                
              
              ,)).toList(),
            
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: () => {},
            child: Text('Botao'),
          ),

         
        ],
        
      ),
      
    );
  }
}
