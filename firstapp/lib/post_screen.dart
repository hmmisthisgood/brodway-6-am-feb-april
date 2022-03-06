import 'package:flutter/material.dart';

import 'widgets/post_widget.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          /// true = to allow pop/back
          /// false = to prevent pop/back

          return Future.value(true);
        },
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  // Navigator.pop(context);
                },
              ),
            ),
            body: Container(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostWidget(""),
                    PostWidget(""),
                    PostWidget(""),
                    PostWidget(""),
                  ],
                ),
              ),
            )));
  }
}
