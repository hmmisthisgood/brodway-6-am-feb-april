import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/common/navigation/routes.dart';

class Hero1 extends StatelessWidget {
  const Hero1({Key? key}) : super(key: key);

  final image =
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";

  final tag = "Hero animation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.hero2, arguments: [image, tag]);

            // Navigator.push(
            //   context,
            //   CustomRoute.fadeRoute(
            //       child: Hero2(
            //     tag: 1,
            //     image: 343,
            //   )),
            // );
          },
          child: Hero(
            tag: tag,
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
