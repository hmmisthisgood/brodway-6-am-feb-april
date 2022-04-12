import 'package:flutter/cupertino.dart';

class Nav {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static pushNamed(String routeName, {Object? arguments}) {
    final ctx = navigatorKey.currentContext;
    // Navigator.pushNamed(ctx!, routeName);
    navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  static  push(Route route) {
    navigatorKey.currentState!.push(route);
  }
}
