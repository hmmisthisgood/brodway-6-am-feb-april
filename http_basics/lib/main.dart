import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http_basics/homepage.dart';


main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialApp, CupertinoApp, WidgetsApp

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Homepage(),
    );
  }
}
