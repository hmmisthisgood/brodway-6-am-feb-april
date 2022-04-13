import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  var _cHeight = 200;
  var _cWidth = 200;
  var _opacity = 1.0;
  Color _cColor = Colors.red;

  _animateContainer() {
    _cHeight = Random().nextInt(700);
    _cWidth = Random().nextInt(400);
    _opacity = Random().nextDouble();
    _cColor = Color.fromRGBO(
        Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _animateContainer,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              height: _cHeight.toDouble(),
              width: _cWidth.toDouble(),
              decoration: BoxDecoration(
                color: _cColor,
              ),
              duration: Duration(milliseconds: 2000),
              curve: Curves.easeOutCubic,
            )
          ],
        ),
      ),
    );
  }
}
