// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalduestwo/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  
  
  const TransactionList({super.key, required this.transactions,required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Nennhuma Transacao Cadastrada',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  color: Colors.purple,
                  scale: 4,
                ),
              )
              // Image(image: AssetImage('assets/images/waiting.png',))
            ],
          )
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final e = transactions[index];
               return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                 child: ListTile(
                    leading: CircleAvatar( 
                      radius: 30,
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.amber,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(child: Text('R\$ ${e.value.toStringAsFixed(2)}'))),
                    ),
                    title: Text(e.tittle, style:  Theme.of(context).textTheme.titleLarge,),
                    subtitle: Text(DateFormat('dd/MM/yyyy').format(e.date)),
                    //nao tem opção de ontap no trailing, apenas na linha toda.
                    trailing: IconButton(onPressed: () => onRemove(e.id),
                     icon: Icon(Icons.delete), color: Colors.red,),
                    // trailing: CircleAvatar(
                    //   radius: 15,
                    //   child: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    //   backgroundColor: Colors.red,
                    // ),
                 ),
               );
              // Card(
              //   child: Row(
              //     children: [
              //       Container(
              //         margin: EdgeInsets.symmetric(
              //             horizontal: 15, vertical: 10),
              //         decoration: BoxDecoration(
              //             border: Border.all(
              //                 color: Theme.of(context).primaryColor,
              //                 width: 2)),
              //         padding: EdgeInsets.all(10),
              //         child:

              //             //Text('R\$ ${e.value.toStringAsFixed(2)}',
              //             Text(
              //           NumberFormat.currency(
              //                   locale: 'pt_BR', symbol: 'R\$')
              //               .format(e.value),
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Theme.of(context).primaryColor),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             e.tittle,
              //             style: Theme.of(context).textTheme.titleLarge,
              //             // style: TextStyle(
              //             // fontSize: 16, fontWeight: FontWeight.bold,
              //             // color: Theme.of(context).primaryColor),
              //           ),
              //           Text(
              //             //e.date.toString()
              //             DateFormat('d/MM/y').format(e.date),
              //             style: Theme.of(context).textTheme.titleMedium,
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // );
            },
            //redundante, padrao de baixo já é assim.
          );
  }
}
