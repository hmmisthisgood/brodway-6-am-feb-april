import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/common/utils/cutom_locale.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tiktok/common/utils/locale_keys.dart';
import 'package:tiktok/feature/settings/cubit/theme_cubit.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool darkMode = false;
  Locale? currentLocale;

  List langs = [CsutomLocale.english, CsutomLocale.nepali, CsutomLocale.french];

  final dropdownItems =
      [CsutomLocale.english, CsutomLocale.nepali, CsutomLocale.french]
          .map((e) => DropdownMenuItem<Locale>(
                child: Text(
                  e.languageCode,
                  style: TextStyle(),
                ),
                value: e,
              ))
          .toList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
          title: Text(
        LocaleKeys.settings.tr(),
      )),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Dark Mode",
              style: theme.textTheme.headline5,
            ),
            trailing: Switch(
              value: darkMode,
              activeColor: Colors.red,
              onChanged: (bool value) {
                darkMode = !darkMode;
                setState(() {});
                BlocProvider.of<ThemeCubit>(context).toogleTheme();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<Locale>(
              items: dropdownItems,
              onChanged: (val) {
                currentLocale = val;
                setState(() {});
                if (val != null) {
                  context.setLocale(val);
                }
              },
              value: currentLocale,
              decoration: InputDecoration(
                  hintText: "Select the language", border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
