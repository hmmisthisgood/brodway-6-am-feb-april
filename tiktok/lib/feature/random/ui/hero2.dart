import 'package:flutter/material.dart';

class Hero2 extends StatelessWidget {
  const Hero2({Key? key, required this.image, required this.tag})
      : super(key: key);

  final String tag;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Hero(
          tag: tag,
          child: Image.network(
            image,
            height: 300,
            width: 300,
          ),
        ),
      ]),
    );
  }
}
