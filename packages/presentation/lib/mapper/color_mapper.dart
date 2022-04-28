import 'package:flutter/material.dart';

class ColorMapper {
  Color getColorByName(String? color) {
    switch (color) {
      case "red":
        return const Color(0xFFFF0000);
      case "blue":
        return const Color(0xFF001AFF);
      case "disabled":
        return const Color(0xFF808080);
      default:
        return const Color(0xFFFFFFFF);
    }
  }
}
