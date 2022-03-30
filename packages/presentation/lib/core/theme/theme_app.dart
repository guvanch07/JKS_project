import 'package:flutter/material.dart';

abstract class AppColors {
  static const accentOrange = Color(0xffFF9D00);
  static const textMain = Color(0xff4C4C4C);
  static const card = Colors.white;
  static const mainbgc = Color(0xFFF5F5F5);
  static const accentGreen = Color(0xff87C009);
  static const iconColor = Color(0xff4C4C4C);
  static const border = Color(0xffD3D2D2);
  static const errorColor = Color(0xffFF4B4B);
  static const unselectedColor = Color(0xffFF4B4B);
}

abstract class _LightColors {
  static const background = AppColors.mainbgc;
  static const card = AppColors.card;
}

/// Reference to the application theme.
abstract class AppTheme {
  static const accentColor = AppColors.accentOrange;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  static ThemeData light() => ThemeData(
        scaffoldBackgroundColor: _LightColors.background,
        splashColor: accentColor,
        brightness: Brightness.light,
        visualDensity: visualDensity,
        cardTheme: const CardTheme(color: AppColors.card),
        fontFamily: "Volte Rounded",
        cardColor: _LightColors.card,
        iconTheme: const IconThemeData(color: AppColors.iconColor),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
      );
}
