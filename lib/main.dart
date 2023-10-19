// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'pages/my_home_page.dart';

main() {
  //forçar o app nao girar a tela.
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.purple,
        textTheme: (TextTheme(
            titleLarge: TextStyle(fontFamily: 'Quicksand', fontSize: 18),
            titleMedium: TextStyle(fontFamily: 'OpenSans', fontSize: 14))),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 25,
              fontWeight: FontWeight.w700),
          centerTitle: true,
        ),
        fontFamily: 'Quicksand',
      ),
    );
  }
}
