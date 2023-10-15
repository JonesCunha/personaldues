// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:personalduestwo/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  

  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      //todo listview precisa ser definido o tamanho, a exemplo do container
      //o componente pai precisa definir o tamanho pre definido
      child: ListView.builder(
        scrollDirection: Axis.vertical,
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final e = transactions[index];
                return Card(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Theme.of(context).primaryColor, width: 2)),
                              padding: EdgeInsets.all(10),
                              child:
        
                                  //Text('R\$ ${e.value.toStringAsFixed(2)}',
                                  Text(
                                NumberFormat.currency(
                                        locale: 'pt_BR', symbol: 'R\$')
                                    .format(e.value),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.tittle,
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                                Text(
                                  //e.date.toString()
                                  DateFormat('d/MM/y').format(e.date),
                                  style: TextStyle(color: Colors.grey[800]),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
              },
              //redundante, padrao de baixo já é assim.
            ),
    );
  }
}