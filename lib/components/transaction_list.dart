// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:personalduestwo/components/transaction_item.dart';
import 'package:personalduestwo/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(
      {super.key, required this.transactions, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    // print('build() TransactionList');
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
              final tr = transactions[index];
              return carditems(tr: tr, onRemove: onRemove);
            },
          );
  }
}

