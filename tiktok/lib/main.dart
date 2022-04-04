import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/app/locale_wrapper.dart';
import 'package:tiktok/app/theme.dart';

import 'package:tiktok/common/utils/constants.dart';
import 'package:tiktok/feature/auth/cubit/auth_cubit.dart';
import 'package:tiktok/feature/feed/cubit/feed_cubit.dart';

import 'package:tiktok/feature/onboarding/ui/screen/splash_screen.dart';
import 'package:tiktok/feature/settings/cubit/theme_cubit.dart';

import 'common/utils/db_service.dart';
import 'feature/auth/ui/screen/add_users.dart';
import 'feature/settings/cubit/theme_state.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DbService.instance.init();
  runApp(LocaleWrapper(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ThemeCubit themeCubit = ThemeCubit();
  final ThemeCubit themeCubit2 = ThemeCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => FeedCubit()),
          BlocProvider(create: (_) => AuthCubit()),
          BlocProvider(create: (_) => ThemeCubit())
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, ThemeState state) {
            final _themeMode =
                state is LightThemeState ? ThemeMode.light : ThemeMode.dark;

            _themeMode.hashCode;

            return MaterialApp(
              title: Constants.appTitle,
              darkTheme: CustomTheme.darkTheme,
              theme: CustomTheme.lightTheme,
              themeMode: _themeMode, // phone settings

              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,

              home: const Addusers(),
            );
          },
        ));
  }
}
