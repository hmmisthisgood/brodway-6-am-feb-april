import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.grey.withOpacity(0.5),
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.black, fontSize: 14), //h6
      headline5: TextStyle(color: Colors.black, fontSize: 16), //h5
      headline4: TextStyle(color: Colors.black, fontSize: 18), //h4
      headline3: TextStyle(color: Colors.black, fontSize: 20), //h3
      headline2: TextStyle(color: Colors.black, fontSize: 22), //h2
      headline1: TextStyle(color: Colors.black, fontSize: 24), //h1
      bodyText1: TextStyle(color: Colors.black, fontSize: 12), //b1
      bodyText2: TextStyle(color: Colors.black, fontSize: 10), //b2
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff1F1b24),
    dividerColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.white, fontSize: 14),
      headline5: TextStyle(color: Colors.white, fontSize: 16),
      headline4: TextStyle(color: Colors.white, fontSize: 18),
      headline3: TextStyle(color: Colors.white, fontSize: 20),
      headline2: TextStyle(color: Colors.white, fontSize: 22),
      headline1: TextStyle(color: Colors.white, fontSize: 24),
      bodyText1: TextStyle(color: Colors.white, fontSize: 12),
      bodyText2: TextStyle(color: Colors.white, fontSize: 10),
    ),
  );
}
