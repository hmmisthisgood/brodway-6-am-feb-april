import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/app/locale_wrapper.dart';
import 'package:tiktok/app/theme.dart';
import 'package:tiktok/common/navigation/custom_navigation.dart';
import 'package:tiktok/common/utils/constants.dart';
import 'package:tiktok/feature/auth/cubit/auth_cubit.dart';
import 'package:tiktok/feature/auth/provider/auth_provider.dart';
import 'package:tiktok/feature/feed/cubit/feed_cubit.dart';
import 'package:tiktok/feature/settings/cubit/theme_cubit.dart';

import 'common/navigation/custom_route_generator.dart';
import 'common/navigation/routes.dart';
import 'common/utils/db_service.dart';
import 'feature/settings/cubit/theme_state.dart';

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
    /// providing the AuthProvider from top level. So that it can be accessed down in widget tree
    return ChangeNotifierProvider(
        create: (_) => AuthProvider(),
        child: MultiBlocProvider(
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
                  navigatorKey: Nav.navigatorKey,
                  onGenerateRoute: customRouteGenerator,
                  initialRoute: Routes.lottieScreen,
                );
              },
            )));
  }
}
