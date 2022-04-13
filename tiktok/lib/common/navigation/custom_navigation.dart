import 'package:flutter/cupertino.dart';
import 'package:tiktok/common/navigation/navigation_animation.dart';

class Nav {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static pushNamed(String routeName, {Object? arguments}) {
    final ctx = navigatorKey.currentContext;
    // Navigator.pushNamed(ctx!, routeName);
    navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  static pushRoute(Route route) {
    navigatorKey.currentState!.push(route);
  }

  static push(Widget screen) {
    if (navigatorKey.currentState != null) {
      navigatorKey.currentState!.push(CustomRoute.upRoute(child: screen));
    }
  }
}
