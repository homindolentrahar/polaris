import 'package:flutter/material.dart';
import 'package:polaris/gen/colors.gen.dart';
import 'package:polaris/gen/fonts.gen.dart';

class AppTheme {
  static ThemeMode mode = ThemeMode.light;
  static ThemeData theme = ThemeData(
    fontFamily: FontFamily.sf,
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ColorName.primary,
      onPrimary: ColorName.white,
      secondary: ColorName.primary,
      onSecondary: ColorName.white,
      error: ColorName.error,
      onError: ColorName.white,
      background: ColorName.light,
      onBackground: ColorName.dark,
      surface: ColorName.white,
      onSurface: ColorName.black,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
