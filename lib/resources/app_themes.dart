import 'package:flutter/material.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData light() {
    return ThemeData.light().copyWith(
      // Define the default colors.
      colorScheme: const ColorScheme.light().copyWith(
        primary: Colors.green,
        secondary: Colors.green,
      ),
      scaffoldBackgroundColor: Colors.green,
    );
  }
}
