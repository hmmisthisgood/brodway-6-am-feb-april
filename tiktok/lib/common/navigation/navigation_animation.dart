import 'package:flutter/cupertino.dart';

class CustomRoute {
  static Route upRoute({required Widget child}) {
    return PageRouteBuilder(
        pageBuilder: (context, first, seconds) {
          return child;
        },
        transitionDuration: Duration(milliseconds: 400),
        transitionsBuilder: (context, first, second, child) {
          final end = Offset.zero;
          final begin = Offset(0.0, 1.0); // (0.0,0.0)
          final curve = Curves.ease;

          final Tween<Offset> tween = Tween(begin: begin, end: end);

          return SlideTransition(
            position: first.drive(tween),
            child: child,
          );
        });
  }

  static Route fadeRoute({required Widget child}) {
    return PageRouteBuilder(
        pageBuilder: (context, first, seconds) {
          return child;
        },
        transitionDuration: Duration(milliseconds: 5000),
        reverseTransitionDuration: Duration(milliseconds: 5000),
        transitionsBuilder: (context, first, second, child) {
          final end = 1.0;
          final begin = 0.0; // (0.0,0.0)
          final curve = Curves.ease;

          final Tween<double> tween = Tween(begin: begin, end: end);

          return FadeTransition(
            opacity: first.drive(tween),
            child: child,
          );
        });
  }
}
