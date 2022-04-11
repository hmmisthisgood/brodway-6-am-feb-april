import 'package:flutter/material.dart';

class Hero2 extends StatelessWidget {
  const Hero2({Key? key}) : super(key: key);

  final image =
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Image.network(
          image,
          height: 300,
          width: 300,
        ),
      ]),
    );
  }
}
