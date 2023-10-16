// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:personalduestwo/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }
      // print(totalSum);
      // print(DateFormat.E().format(weekDay)[0]);

      return {'day': DateFormat.EEEE().format(weekDay), 'value': totalSum};
    });
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (soma, tr) {
      return soma + (tr['value'] as double) ;
    });
  }

  const Chart({super.key, required this.recentTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            double trvalor = tr['value'] as double ;
            String dia = tr['day'].toString();
            String diaCompleto;

            switch(dia) {
              case 'Sunday':
              diaCompleto = 'Domingo';
              break;
              case 'Monday':
              diaCompleto = 'Segunda';
              break;
              case 'Friday':
              diaCompleto = 'Sexta';
              break;
              case 'Wednesday':
              diaCompleto = 'Quarta';
              break;
              case 'Tuesday':
              diaCompleto = 'Terça';
              break;
              case 'Thursday':
              diaCompleto = 'Quinta';
              break;
              case 'Saturday':
              diaCompleto = 'Sabado';
              break;
              default:
              diaCompleto = dia;
              break;
            }
          
            // return Text('${e['day']} : ${e['value']}');
            //  return ChartBar(
            //    label: tr['day'].toString(),
            //    value: double.parse(tr['value'].toString()),
            //    percentage: 0,
            //  );
            return Expanded(
              child: Column(
                children: [
                  FittedBox(
                    child: Text(
                      'R\$${trvalor.toStringAsFixed(2)}'
                       , style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 60,
                    width: 10,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        FractionallySizedBox(
                          heightFactor: double.parse('${tr['value']}')  / _weekTotalValue,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // Text('${tr['day']}'),
                  FittedBox(child: Text(diaCompleto)),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
