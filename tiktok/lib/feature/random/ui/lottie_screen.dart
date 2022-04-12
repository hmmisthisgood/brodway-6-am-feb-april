import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../common/utils/assets.dart';

class LottieScreen extends StatelessWidget {
  const LottieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(Assets.messageAnimation,
          // height: 200,
          // width: 500,
          // fit: BoxFit.fill,
          errorBuilder: (context, e, s) =>
              Center(child: Text("Cannot be loaded"))),
    );
  }
}
