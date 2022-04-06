import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ClipperWidget extends StatelessWidget {
  const ClipperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 500,
              width: 500,
              color: Colors.green,
            ),
          ),
          CustomPaint(
            painter: MyCustomPainter(),
            child: Container(
              height: 200,
              width: 200,
              color: Colors.pink,
            ),
          )
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(100, 0);
    path.lineTo(100, 100);
    path.lineTo(0, 100);
    path.lineTo(0, 0);
    path.close();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    Path path = Path();
    path.lineTo(100, 0);
    path.lineTo(100, 100);
    path.lineTo(0, 100);
    path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
