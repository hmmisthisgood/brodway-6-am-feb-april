import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok/common/navigation/routes.dart';
import 'package:tiktok/common/utils/assets.dart';
import 'package:tiktok/common/utils/shared_pref.dart';

import '../../../../common/navigation/custom_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    checkLogInStatusAndNavigate();
  }

  checkLogInStatusAndNavigate() async {
    bool isLoggedIn = await SharedPref.hasUserLoggedIn();

    print("isLoggedIn: $isLoggedIn");

    await Future.delayed(Duration(milliseconds: 2000), () {
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, Routes.homeRoute);

        return;
      }
      // Navigator.pushNamed(context, "/looooogin");
      // Navigator.pushReplacementNamed(context, "/login");
      // Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);

      /// if not logged in
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          Assets.appIcon,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
