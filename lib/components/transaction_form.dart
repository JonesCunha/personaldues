// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  TransactionForm({super.key, required this.onSubmit}) {
    // print('Constructor TransactionForm');
  }

  final void Function(String, double, DateTime) onSubmit;

  @override
  State<TransactionForm> createState() {
    // print('create state dentro do transaction form');
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  _TransactionFormState() {
    // print('constructor _trasnsactionFormState');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('initState dentro do _trasnsactionFormState');
  }

  @override
  void didUpdateWidget(covariant TransactionForm oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    
    // print('UpdateState ()  _trasnsactionFormState');
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // print('dispose()  _trasnsactionFormState');

  }

  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate;

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate!);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('build() TransactionForm');
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.only(
                top: 10,
                right: 10,
                left: 10,
                bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(children: [
                TextField(
                    controller: _titleController,
                    onSubmitted: (_) => _submitForm(),
                    decoration: InputDecoration(
                      labelText: 'Titulo',
                    )),
                TextField(
                  controller: _valueController,
                  onSubmitted: (_) => _submitForm(),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'Valor (R\$)'),
                ),
                Container(
                  height: 70,
                  width: double.infinity,
                  padding: EdgeInsets.all(3),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? 'Nenhuma Data Selecionada'
                              : DateFormat('d/M/y').format(_selectedDate!),
                        ),
                      ),
                      SizedBox(
                        width: 28,
                      ),
                      ElevatedButton(
                          onPressed: _showDatePicker,
                          child: Text(
                            'Selecionar Data',
                          )),
                    ],
                  ),
                )
              ]),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor),
            onPressed: _submitForm,
            child: Text(
              'Adicionar',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
