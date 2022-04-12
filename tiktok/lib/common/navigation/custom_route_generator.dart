import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/common/navigation/navigation_animation.dart';
import 'package:tiktok/common/navigation/routes.dart';
import 'package:tiktok/feature/feed/ui/screen/home_screen_with_cubit.dart';
import 'package:tiktok/feature/random/ui/clipper.dart';
import 'package:tiktok/feature/random/ui/hero1.dart';
import 'package:tiktok/feature/random/ui/listview.dart';
import 'package:tiktok/feature/random/ui/lottie_screen.dart';
import 'package:tiktok/feature/random/ui/screen_with_provider.dart';
import 'package:tiktok/feature/random/ui/stream_builder_widget.dart';
import 'package:tiktok/feature/random/ui/value_listnable.dart';

import '../../feature/auth/ui/screen/login_screen.dart';
import '../../feature/onboarding/ui/screen/splash_screen.dart';
import '../../feature/random/ui/hero2.dart';
import '../../feature/random/ui/random.dart';

Route customRouteGenerator(RouteSettings settings) {
  final name = settings.name;

  switch (name) {
    case "/":
      return CupertinoPageRoute(builder: (_) => SplashScreen());

    case Routes.splashRoute:
      return CupertinoPageRoute(builder: (_) => SplashScreen());

    case Routes.loginRoute:
      return CupertinoPageRoute(builder: (_) => LoginScreen());

    case Routes.homeRoute:
      return MaterialPageRoute(builder: (_) => HomeScreenWithCubit());

    case Routes.randomRoute:
      return MaterialPageRoute(builder: (_) => ClipperWidget());

    case Routes.vListableRoute:
      return MaterialPageRoute(builder: (_) => ValueListenableWidget());

    case Routes.listRoute:
      return MaterialPageRoute(builder: (_) => ListViewWidget());
    case Routes.randomScreen:
      return MaterialPageRoute(builder: (_) => RandromWidget());

    case Routes.streamScreen:
      return MaterialPageRoute(builder: (_) => StreamUi());

    case Routes.providerScreen:
      return MaterialPageRoute(builder: (_) => ProviderScreen());

    case Routes.hero1:
      return CustomRoute.upRoute(child: Hero1());

    case Routes.hero2:
      final args = settings.arguments as List;

      return CustomRoute.fadeRoute(child: Hero2(tag: args[1], image: args[0]));
    case Routes.lottieScreen:
      return CustomRoute.fadeRoute(child: LottieScreen());
    default:
      return CupertinoPageRoute(builder: (_) => SplashScreen());
  }
}
