import 'package:flutter/material.dart';
import 'package:tiktok/feature/random/ui/hero2.dart';

class Hero1 extends StatelessWidget {
  const Hero1({Key? key}) : super(key: key);

  final image =
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Hero2()));
          },
          child: Hero(
            tag: "Hero animation",
            child: Image.network(
              image,
              height: 100,
              width: 100,
            ),
          ),
        ),
      ]),
    );
  }
}
