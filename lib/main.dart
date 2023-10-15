
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'pages/myHomePage.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.purple
        ),
    );
  }
}

