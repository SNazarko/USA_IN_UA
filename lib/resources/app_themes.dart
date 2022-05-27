import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData light() {
    return ThemeData.light().copyWith(
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          color: AppColors.text,
          fontWeight: FontWeight.w700,
        ),
        bodyText1: TextStyle(
            color: AppColors.text, fontWeight: FontWeight.w400, fontSize: 14.0),
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
