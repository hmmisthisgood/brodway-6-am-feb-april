import 'package:flutter/material.dart';

import 'navigation_screen.dart';


void main() {
  runApp(OurApp());
}

// Stateless , Stateful

class OurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp , CupertinoApp

    return MaterialApp(
        title: "Our app",
        theme: ThemeData(primarySwatch: Colors.pink),
        home: NavigationScreen()
        // home=  "/" rooute
        //  OurHomepage(),
        );
  }
}



/// 1. Container = just a box (4 corner)
/// 2. Text , RichText  = for showing text
/// 3. Row / Column = Layout , horizaontal or vertical
///
/// 4. ListView/ SingleChildScrollView/ GridView = Scrollable view

/// 5. MaterialButton/ TextButton  = pre built buttons
/// 6. GestureDetector/ InkWell = Make anything clicakble  or hadle users gestures
/// 6. Icon = To how icons in the app

/// 5. TabView, PageView, BottomNavBar
/// 7. Padding/ SizedBox/ FiteedBox
/// 8. Image(asset, file, network), FadeInImage = to show image
/// 9. Form, TextField, TextFormField = Form and inputs
/// 10. Stack
/// 11. ClipRRect , SafeArea

/// leading
/// suffix
/// prefix
/// trailing
