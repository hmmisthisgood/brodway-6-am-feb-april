import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/common/utils/shared_pref.dart';
import 'package:tiktok/feature/settings/cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightThemeState());

  toogleTheme() async {
    final currentTheme = await SharedPref.getThemeMode();

    // light mode
    if (currentTheme == ThemeMode.dark) setLightTheme();
    // dark mode
    if (currentTheme == ThemeMode.light) setDarkTheme();
  }

  setLightTheme() async {
    SharedPref.setThemeMode(ThemeMode.light.toString());
    emit(LightThemeState());
  }

  setDarkTheme() async {
    SharedPref.setThemeMode(ThemeMode.dark.toString());
    emit(DarkThemeState());
  }
}
