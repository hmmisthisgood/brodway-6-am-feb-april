import 'package:firstapp/utils/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // SvgPicture.asset(assetName),
        Icon(MyIcons.home),

        Text("yet another time",
            style: TextStyle(color: Colors.black, fontSize: 40)),
        Text("This is custom Font0",
            style: TextStyle(color: Colors.black, fontSize: 40)),
        SvgPicture.asset(
          "assets/images/test.svg",
          height: 200,
          width: 200,
          color: Colors.green,
        ),
      ]),
    );
  }
}
