import 'package:flutter/material.dart';
import 'package:presentation/core/theme/theme_app.dart';

abstract class Styles {
  static const TextStyle headline1 = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontFamily: "Volte Rounded",
      color: AppColors.textMain);

  static const TextStyle headline2 = TextStyle(
    color: AppColors.textMain,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: "Volte Rounded",
  );

  static const TextStyle splashHeadLine1 = TextStyle(
      fontSize: 32,
      fontFamily: "Georgia",
      color: Colors.white,
      fontWeight: FontWeight.w700);

  static const TextStyle splashHeadLine2 = TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontFamily: "Volte Rounded",
      fontWeight: FontWeight.w600);
}
