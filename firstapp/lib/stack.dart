import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StackWidget extends StatelessWidget {
  final image =
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 500,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/wall.jpg",
                // height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              Align(
                  child: FadeInImage(
                // AssetImage, NetworkImage
                image: NetworkImage(image),
                placeholder: AssetImage("assets/images/wall.jpg"),
                fadeInCurve: Curves.bounceIn,
              )),
              // Positioned can be used only in stack

              Positioned(
                  bottom: 200,
                  top: 0,
                  child: Icon(
                    Icons.home,
                    size: 40,
                    color: Colors.black,
                  )),
              Positioned(
                  bottom: 200,
                  top: 0,
                  child: Icon(
                    Icons.car_rental,
                    size: 40,
                    color: Colors.white,
                  )),

              Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.align_horizontal_center,
                  color: Colors.green,
                  size: 50,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.5),
              ) //
              //
              //
            ],
          ),
        ),
      ),
    );
  }
}
