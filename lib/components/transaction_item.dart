import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalduestwo/models/transaction.dart';

class carditems extends StatelessWidget {
  const carditems({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  final Transaction tr;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
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
              child: FittedBox(
                  child: Text('R\$ ${tr.value.toStringAsFixed(2)}'))),
        ),
        title: Text(
          tr.tittle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(DateFormat('dd/MM/yyyy').format(tr.date)),
        //nao tem opção de ontap no trailing, apenas na linha toda.
        trailing: IconButton(
          onPressed: () => onRemove(tr.id),
          icon: Icon(Icons.delete),
          color: Colors.red,
        ),
        // trailing: CircleAvatar(
        //   radius: 15,
        //   child: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        //   backgroundColor: Colors.red,
        // ),
      ),
    );
  }
}
