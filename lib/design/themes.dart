import 'package:flutter/material.dart';
import 'package:test_app/design/colors.dart';

class TestThemes {
  TestThemes._();
  static ThemeData defaultTheme = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: TestColors.brandPrimaryColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      headlineLarge:
          TextStyle(fontSize: 21.0, color: TestColors.brandPrimaryColor),
      labelLarge: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: TestColors.brandPrimaryColor,
      ),
      labelMedium: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        color: TestColors.brandLightDarkColor,
      ),
      labelSmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: TestColors.brandDarkColor,
      ),
      bodyLarge: TextStyle(fontSize: 14.0),
      bodyMedium: TextStyle(fontSize: 13.0),
      bodySmall: TextStyle(fontSize: 10.0),
    ),
  );
}
