import 'package:flutter/material.dart';
import 'package:tiktok/feature/random/ui/animated_screen.dart';
import 'package:tiktok/feature/random/ui/animation_with_controller.dart';
import 'package:tiktok/feature/random/ui/clipper.dart';
import 'package:tiktok/feature/random/ui/hero1.dart';
import 'package:tiktok/feature/random/ui/lottie_screen.dart';
import 'package:tiktok/feature/random/ui/screen_with_provider.dart';
import 'package:tiktok/feature/random/ui/transform_widget.dart';
import 'package:tiktok/feature/random/ui/value_listnable.dart';

import '../../../common/navigation/custom_navigation.dart';
import 'listview.dart';
import 'stream_builder_widget.dart';

class RandomUi extends StatelessWidget {
  RandomUi({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> screenDetails = [
    {"screen": "Clipper", "widget": ClipperWidget()},
    {"screen": "animated screen", "widget": AnimatedScreen()},
    {"screen": "Hero1", "widget": Hero1()},
    {"screen": "ListView ", "widget": ListViewWidget()},
    {"screen": "Lottie ", "widget": LottieScreen()},
    {"screen": "Provider usage", "widget": ProviderScreen()},
    {"screen": "Stream builder", "widget": StreamUi()},
    {"screen": "Value listenable builder", "widget": ValueListenableWidget()},
    {
      "screen": "Animation with custom controller",
      "widget": AnimWithController()
    },
    {"screen": "Transform screen", "widget": TransformWidget()}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          children: List.generate(
        screenDetails.length,
        (index) {
          final details = screenDetails[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Colors.pink,
              minWidth: double.infinity,
              onPressed: () {
                Nav.push(details['widget']);
              },
              child: Text(
                details['screen'],
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      )),
    );
  }
}
