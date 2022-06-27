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
            fontFamily: 'Lato',
        ),
        bodyText1: TextStyle(
          color: AppColors.text,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          fontFamily: 'Lato',
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
