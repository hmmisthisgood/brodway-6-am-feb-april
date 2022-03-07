import 'package:firstapp/gridview.dart';
import 'package:firstapp/home_page.dart';
import 'package:firstapp/post_screen.dart';
import 'package:firstapp/stack.dart';
import 'package:firstapp/stateful.dart';
import 'package:firstapp/widgets/login_screen.dart';
import 'package:flutter/material.dart';

import 'listview.dart';
import 'pageview.dart';
import 'tab_bar_view_scree.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  buildButton(
      {required String title, required Function(String) whatToDoWhenPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        color: Colors.purple,
        onPressed: () {
          whatToDoWhenPressed("Ops I am prssed");
        },
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Today we are navigating")),
      body: ListView(children: [
        buildButton(
          title: "Login  Screen",
          whatToDoWhenPressed: (message) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
        buildButton(
          title: "Post screen",
          whatToDoWhenPressed: (message) {
            /// Navigator= stack form

            /// push = for pushing a new page/screen
            /// pop= to exit or go back to previous screen
            ///

            /// In built routes:
            /// 1. MaterialPageRoute  = androd style page navigation (fade in )
            /// 2. CupertinoPageRoute= ios style (slide transition)

            /// (1) first option:
            final postRoute =
                MaterialPageRoute(builder: (context) => PostScreen());
            // "/login";

            Navigator.push(context, postRoute);
            // Navigator.push(context, postRoute);

            /// (2) second option:
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => PostScreen()));

            /// (3):option
            // Navigator.pushNamed(context, "/profile");
          },
        ),
        buildButton(
          title: "Gridview screen",
          whatToDoWhenPressed: (message) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GridViewScreen()));
          },
        ),
        buildButton(
          title: "Staateful screen",
          whatToDoWhenPressed: (message) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Newhomepage()));
          },
        ),
        buildButton(
          title: "Stack screen",
          whatToDoWhenPressed: (message) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StackWidget()));
          },
        ),
        buildButton(
          title: "listview screen",
          whatToDoWhenPressed: (message) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PostsListView()));
          },
        ),
        buildButton(
          title: "tabview screen",
          whatToDoWhenPressed: (message) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TabScreen()));
          },
        ),
        buildButton(
          title: "pageview screen",
          whatToDoWhenPressed: (message) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PageViewScreen()));
          },
        ),
        buildButton(
          title: "first learned screen",
          whatToDoWhenPressed: (message) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OurHomepage()));
          },
        )
      ]),
    );
  }
}
