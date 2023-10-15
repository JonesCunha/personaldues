import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(labelText: 'Titulo'),
                    ),
                    TextField(
                      controller: valueController,
                      decoration: InputDecoration(labelText: 'Valor (R\$)'),
                    ),
                  ]),
                ),
              ),
      ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[300]),
            child: Text(
              'Adicionar',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            onPressed: () => {},
          ),
      ],
    );
  }
}