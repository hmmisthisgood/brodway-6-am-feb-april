import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageViewScreen extends StatelessWidget {
  final pageController = PageController(initialPage: 1);

  buildPageViewWithBuilder() {
    return PageView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder: (conext, currentIndex) {
          return Container(
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                currentIndex.toString(),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        });
  }

  buildNormalPageView() {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: pageController,
      onPageChanged: (currentIndex) {
        print("ccurrent index is : $currentIndex");
      },
      children: [
        Container(color: Colors.red),
        Container(color: Colors.yellow),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildPageViewWithBuilder());
  }
}

// PageView , PageView.builder, Page.custom
