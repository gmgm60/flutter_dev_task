import 'package:flutter/material.dart';
import 'package:flutter_dev_task/core/constants/colors.dart';

final lightTheme = ThemeData(
  fontFamily: 'Almarai',
  scaffoldBackgroundColor: mainBackground,
  textTheme: const TextTheme(
      headline6: TextStyle(
    color: titleColor,
        fontWeight: FontWeight.bold,
  )),
  primarySwatch: Colors.blue,
);
