import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({super.key, required this.onSubmit});

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

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
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          onPressed: () {
            final title = titleController.text;
            final value = double.tryParse(valueController.text) ?? 0.0;
            if (title.length < 1) {
            } else {
              onSubmit(title, value);
            }
          },
        ),
      ],
    );
  }
}
