import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AnimWithController extends StatefulWidget {
  const AnimWithController({Key? key}) : super(key: key);

  @override
  State<AnimWithController> createState() => _AnimWithControllerState();
}

class _AnimWithControllerState extends State<AnimWithController>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> iconsAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
      reverseDuration: Duration(milliseconds: 2000),
    )..addListener(() {
        var status = animationController.status;

        if (status == AnimationStatus.completed) {
          animationController.reverse();
        }
      });
//1.0  - 2.0 .  // 1.0, 1.1,1.2,1.3

    iconsAnimation = Tween(begin: 1.0, end: 3.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.ease),
    );
  }

// duration
// size
// position

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // InkWell(onTap: () {}, child: Text("click this text")),
          Center(
            child: Container(
              child: InkWell(
                onTap: () {
                  animationController.forward();
                },
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: ScaleTransition(
                    scale: iconsAnimation,
                    child: Icon(
                      AntDesign.like2,
                      color: Colors.green,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  animationController.forward();
                },
                child: Text("Forward"),
              ),
              MaterialButton(
                onPressed: () {
                  animationController.reverse();
                },
                child: Text("Reverse"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
