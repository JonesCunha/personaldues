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
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (soma, tr) {
      return soma + (tr['value'] as double);
    });
  }

  Chart({super.key, required this.recentTransaction}){
    // print('Constructor Meu Chart!');
  }

  @override
  Widget build(BuildContext context) {
    // print('build() Chart');
    return Container(
      decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(6) ),
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
    
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: groupedTransactions.map((tr) {
              double trvalor = tr['value'] as double;
              String dia = tr['day'].toString();
              String diaCompleto;
    
              switch (dia) {
                case 'Sunday':
                  diaCompleto = 'Dom';
                  break;
                case 'Monday':
                  diaCompleto = 'Seg';
                  break;
                case 'Friday':
                  diaCompleto = 'Sex';
                  break;
                case 'Wednesday':
                  diaCompleto = 'Qua';
                  break;
                case 'Tuesday':
                  diaCompleto = 'Ter';
                  break;
                case 'Thursday':
                  diaCompleto = 'Qui';
                  break;
                case 'Saturday':
                  diaCompleto = 'Sab';
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
              return LayoutBuilder(
                builder: (context, constraints) {      
                  return Column(
                    children: [
                      Container(
                        height: constraints.maxHeight * 0.10,
                        child: FittedBox(
                          child: Text(
                            '${trvalor.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.60,
                        width: 10, //constraints.maxWidth * 0.20,
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
                              heightFactor: double.parse('${tr['value']}') /
                                  _weekTotalValue,
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
                        height: constraints.maxHeight * 0.05,
                      ),
                      // Text('${tr['day']}'),
                      SizedBox(
                        height: constraints.maxHeight * 0.10,
                        child: FittedBox(
                            child: Text(
                          diaCompleto, style: TextStyle(fontSize: 10),
                        )),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
