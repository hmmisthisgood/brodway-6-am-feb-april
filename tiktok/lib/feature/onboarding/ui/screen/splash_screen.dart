import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok/common/utils/assets.dart';
import 'package:tiktok/common/utils/shared_pref.dart';
import 'package:tiktok/feature/auth/ui/screen/login_screen.dart';
import 'package:tiktok/feature/feed/ui/screen/home_screen.dart';
import 'package:tiktok/feature/feed/ui/screen/home_screen_with_cubit.dart';

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
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreenWithCubit()));
        return;
      }

      /// if not logged in
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginScreen()));
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
