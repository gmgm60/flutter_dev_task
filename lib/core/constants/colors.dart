import 'package:flutter/material.dart';

const Color mainBackground = Color(0xFFF5F5F5);
final Color textFormBackground = const Color(0xff9cb3be).withOpacity(0.2);
// MaterialColor textFormBackground = MaterialColor(0xff9cb3be, color);
// MaterialColor mainBackground = MaterialColor(0xFFF5F5F5, color);
const Color textColor = Color(0xFF585858);
const Color titleColor = Color(0xFF2A5579);
const Color buttonBackground = Color(0xFFF26D33);

//
// class HexColor extends Color {
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF$hexColor";
//     }
//     return int.parse(hexColor, radix: 16);
//   }
//
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
// }
//
//
//
// Map<int, Color> color =
// {
//   50:const Color.fromRGBO(4,131,184, .1),
//   100:const Color.fromRGBO(4,131,184, .2),
//   200:const Color.fromRGBO(4,131,184, .3),
//   300:const Color.fromRGBO(4,131,184, .4),
//   400:const Color.fromRGBO(4,131,184, .5),
//   500:const Color.fromRGBO(4,131,184, .6),
//   600:const Color.fromRGBO(4,131,184, .7),
//   700:const Color.fromRGBO(4,131,184, .8),
//   800:const Color.fromRGBO(4,131,184, .9),
//   900:const Color.fromRGBO(4,131,184, 1),
// };
