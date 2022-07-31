import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_task/core/constants/colors.dart';

import '../../../generated/locale_keys.g.dart';

class ChangeLang extends StatelessWidget {
  const ChangeLang({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(LocaleKeys.changeLang.tr(),
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: buttonBackground)),
      onPressed: () {
        if (context.locale == const Locale('ar')) {
          EasyLocalization.of(context)?.setLocale(const Locale('en'));
        } else if (context.locale == const Locale('en')) {
          EasyLocalization.of(context)?.setLocale(const Locale('ar'));
        }
      },
    );
  }
}
