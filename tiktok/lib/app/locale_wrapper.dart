import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../common/utils/assets.dart';
import '../common/utils/cutom_locale.dart';

class LocaleWrapper extends StatelessWidget {
  const LocaleWrapper({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: [
        CsutomLocale.nepali,
        CsutomLocale.english,
        CsutomLocale.french,
      ],
      fallbackLocale: CsutomLocale.english,
      child: child,
      useOnlyLangCode: true,
      saveLocale: true,
      startLocale: CsutomLocale.nepali,
      path: Assets.traslations,
    );
  }
}
