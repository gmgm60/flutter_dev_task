import 'package:flutter/material.dart';
import 'package:flutter_dev_task/core/constants/colors.dart';

final lightTheme = ThemeData(
  listTileTheme: const ListTileThemeData(iconColor: titleColor),
  appBarTheme: const AppBarTheme(color: appBarColor,foregroundColor: Colors.white),
 tabBarTheme: const TabBarTheme(indicator: UnderlineTabIndicator()),
  fontFamily: 'Almarai',
  scaffoldBackgroundColor: mainBackground,
  textTheme:  TextTheme(
      headline6: const TextStyle(
    color: titleColor,
        fontWeight: FontWeight.bold,
  ),
  bodyText2: const TextStyle(color: textColor),
  button: const TextStyle(color: tileTextColor),
  subtitle1: const TextStyle(color: drawerTextColor),
  subtitle2: TextStyle(color: titleColor.withOpacity(0.78),),
  caption: const TextStyle(color: iconsColor),
  bodyText1: const TextStyle(color: titleColor,fontWeight: FontWeight.normal,fontSize: 15)

  ),
  iconTheme: const IconThemeData(color: iconsColor),
);
