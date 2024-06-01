import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Colors.white;
  static Color errorColor = HexColor.fromHex('#FF4C5E');
  static Color itemBackgroundColor = HexColor.fromHex('#E7E7E7');
  static Color unselectedTextColor = HexColor.fromHex('#B7B7B7');
  static Color selectedTextColor = HexColor.fromHex('#101010');
  static Color descriptionTextColor = HexColor.fromHex('#6F6F6F');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
