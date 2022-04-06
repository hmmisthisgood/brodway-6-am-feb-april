import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/common/navigation/routes.dart';
import 'package:tiktok/feature/feed/ui/screen/home_screen_with_cubit.dart';
import 'package:tiktok/feature/random/ui/clipper.dart';

import '../../feature/auth/ui/screen/login_screen.dart';
import '../../feature/onboarding/ui/screen/splash_screen.dart';

Route customRouteGenerator(RouteSettings settings) {
  final name = settings.name;

  switch (name) {
    case Routes.splashRoute:
      return CupertinoPageRoute(builder: (_) => SplashScreen());

    case Routes.loginRoute:
      return CupertinoPageRoute(builder: (_) => LoginScreen());

    case Routes.homeRoute:
      return MaterialPageRoute(builder: (_) => HomeScreenWithCubit());

    case Routes.randomRoute:
      return MaterialPageRoute(builder: (_) => ClipperWidget());

    default:
      return CupertinoPageRoute(builder: (_) => SplashScreen());
  }
}
