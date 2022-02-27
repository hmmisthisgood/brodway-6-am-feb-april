import 'package:firstapp/stack.dart';
import 'package:flutter/material.dart';
import './stateful.dart';
import 'post_screen.dart';

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
        home: PostScreen()
        //  OurHomepage(),
        );
  }
}

class Our extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OurHomepage extends StatelessWidget {
  final image =
      'https://i1.wp.com/techweez.com/wp-content/uploads/2020/11/Instagram-Reels.png?resize=768%2C490&ssl=1';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        drawer: Drawer(),
        appBar: AppBar(
          // leading: Icon(Icons.home),
          title: Text("Our App"),
          centerTitle: true,
          actions: [
            Icon(Icons.message),
            // Icon(Icons),
            Icon(Icons.plus_one),
            Icon(Icons.home),
          ],
        ),
        // drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        body: Container(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,

            // mainAxisSize: MainAxisSize.min,
            children: [
              // Container(
              //   // color: Colors.black,
              //   child: Column(
              //     // mainAxisSize: MainAxisSize.min,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       MaterialButton(
              //         onPressed: () {},
              //         color: Colors.teal,
              //         // Color(0xff01AB),
              //         child: Text("PRess me"),
              //       ),
              //       MaterialButton(
              //         onPressed: () {},
              //         color: Colors.teal,
              //         // Color(0xff01AB),
              //         child: Text("PRess me"),
              //       ),
              //       MaterialButton(
              //         onPressed: () {},
              //         color: Colors.teal,
              //         // Color(0xff01AB),
              //         child: Text("PRess me"),
              //       ),
              //     ],
              //   ),
              // ),
              // TextButton(
              //   onPressed: () {},
              //   // color: Colors.teal,
              //   // Color(0xff01AB),
              //   child: Text("PRess me"),
              // ),
              // TextField(),

              Row(
                children: [
                  Switch(value: true, onChanged: (value) {}),
                  Switch(value: true, onChanged: (value) {}),
                  Switch(value: true, onChanged: (value) {}),
                ],
              ),

              Container(
                height: 300,
                width: 300,

                // alignment: Alignment.center,
                // padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  // color: Colors.yellow,
                  border: Border.all(),
                  gradient: LinearGradient(
                      colors: [Colors.yellow, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(50),
                  // shape: BoxShape.circle,
                ),
                // child: Container(
                //   height: 100,
                //   width: 200,
                //   margin: EdgeInsets.all(15),
                //   color: Colors.pink,
                // )
                //  Center(child: Text("this is container")),
              ),

              Switch(value: true, onChanged: (value) {}),

              // GestureDetector(
              //   onTap: () {
              //     print("single clicked on tap");
              //   },
              //   onDoubleTap: () {
              //     print(" i am double tapped");
              //   },
              //   child: Image.network(image),
              // )
            ],
          ),
        )

        // Container(
        //   color: Colors.green,
        //   child: ListView(
        //     scrollDirection: Axis.horizontal,
        //     children: [
        //       Image.network(image),
        //       Image.network(image),
        //       Image.network(image),
        //       Image.network(image),
        //       Image.network(image),
        //       Image.network(image),
        //       Image.network(image),
        //       Icon(Icons.message),
        //       Icon(Icons.message),
        //       Icon(Icons.message),
        //       Icon(Icons.message),
        //       Icon(Icons.message),
        //     ],
        //   ),
        // ),

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
