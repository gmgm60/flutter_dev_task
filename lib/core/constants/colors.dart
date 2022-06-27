import 'package:flutter/material.dart';

 Color mainBackground = HexColor("#F5F5F5");// Color(0xFFF5F5F5);
 Color textFormBackground = HexColor("#9CB3BE");// Color(0xff9cb3be);
const Color textColor = Color(0xFF585858);
const Color titleColor = Color(0xFF2A5579);
const Color buttonBackground = Color(0xFFF26D33);




class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}