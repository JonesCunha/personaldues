// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'components/theme.dart';
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
      theme: Thema(),
    );
  }


}
