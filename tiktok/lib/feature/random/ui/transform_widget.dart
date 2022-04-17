import 'dart:math';

import 'package:flutter/material.dart';

class TransformWidget extends StatefulWidget {
  const TransformWidget({Key? key}) : super(key: key);

  @override
  State<TransformWidget> createState() => _TransformWidgetState();
}

class _TransformWidgetState extends State<TransformWidget> {
  Offset offset = Offset.zero;
  double scale = 1.0;
  double angle = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // RotatedBox(
            //     quarterTurns: 2,
            //     child: Text(
            //       "This is a text",
            //       style: TextStyle(fontSize: 20),
            //     )),

            /// transform widgett

            Transform.rotate(
              angle: angle,
              child: Text("This is a text", style: TextStyle(fontSize: 20)),
            ),

            SizedBox(height: 50),
            Transform.scale(
              scale: scale,
              child: Icon(
                Icons.home,
              ),
            ),
            SizedBox(height: 50),

// [1 0 0 0
//  0 1 0 0 =I
//  0 0 1 0
//  0 0 0 1
// ]

// [0 0 0
// 0 0 0
            // 0 0 0
// ]

            /// (0,0), (100,200)
            Transform.translate(
              offset: offset,
              child: Container(height: 100, width: 100, color: Colors.black),
            ),
            SizedBox(height: 50),
//3.14
            Transform(
              transform: Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
                ..rotateX(angle),
              // ..rotateY(angle)
              // ..translate(2),
              child:
                  Text("This is another text", style: TextStyle(fontSize: 20)),
            ),

            MaterialButton(
              onPressed: () {
                offset = Offset(150, 200);
                angle = pi / 4;
                scale = 5;
                setState(() {});
              },
              color: Colors.green,
              child: Text("Tranform things"),
            )
          ],
        ),
      ),
    );
  }
}
