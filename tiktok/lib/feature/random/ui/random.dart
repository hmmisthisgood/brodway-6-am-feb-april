import 'package:flutter/material.dart';

class RandromWidget extends StatelessWidget {
  const RandromWidget({Key? key}) : super(key: key);

  final imageUrl =
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink,

              /// Use decoration image instead of ClipRRect
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover),
            ),
            // child: Image.network(imageUrl),
          ),
        )
      ]),
    );
  }
}
