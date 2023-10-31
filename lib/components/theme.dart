  import 'package:flutter/material.dart';

ThemeData Thema() {
    return ThemeData(
      hintColor: Colors.amber,
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
    );
  }