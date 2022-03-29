import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tiktok/common/utils/constants.dart';
import 'package:tiktok/feature/auth/cubit/auth_cubit.dart';
import 'package:tiktok/feature/feed/cubit/feed_cubit.dart';

import 'package:tiktok/feature/feed/ui/screen/home_screen_with_cubit.dart';
import 'package:tiktok/feature/onboarding/ui/screen/splash_screen.dart';

import 'feature/auth/ui/screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => FeedCubit()),
          BlocProvider(create: (_) => AuthCubit()),
        ],
        child: MaterialApp(
          title: Constants.appTitle,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: TextTheme(
                headline6: TextStyle(color: Colors.white, fontSize: 14),
                headline5: TextStyle(color: Colors.white, fontSize: 16),
                headline4: TextStyle(color: Colors.white, fontSize: 18),
                headline3: TextStyle(color: Colors.white, fontSize: 20),
                headline2: TextStyle(color: Colors.white, fontSize: 22),
                headline1: TextStyle(color: Colors.white, fontSize: 24),
                bodyText1: TextStyle(color: Colors.white, fontSize: 12),
                bodyText2: TextStyle(color: Colors.white, fontSize: 10),
              )),
          home: const SplashScreen(),
        ));
  }
}
