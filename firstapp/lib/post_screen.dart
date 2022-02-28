import 'package:flutter/material.dart';

import 'widgets/post_widget.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
        ));
  }
}
