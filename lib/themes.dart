import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.lightGreen,
      fontFamily: 'Urbanist',
      cardColor: Colors.white,
      canvasColor: creamColor,
      scaffoldBackgroundColor: Color.fromRGBO(247, 248, 249, 1),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
      ));

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color lightGreenColor = Color.fromRGBO(98, 178, 70, 1);
}
