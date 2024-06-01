import 'package:flutter/material.dart';
import 'package:shoesly/core/theme/app_colors.dart';
import 'package:shoesly/core/theme/font_manager.dart';
import 'package:shoesly/core/theme/styles_manager.dart';

class AppTheme {
  static final lightThemeMode = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      titleLarge: getBoldStyle(
        color: AppColors.selectedTextColor,
        fontSize: FontSize.s30,
      ),
      titleMedium: getSemiBoldStyle(
        color: AppColors.selectedTextColor,
        fontSize: FontSize.s16,
      ),
      titleSmall: getRegularStyle(
        color: AppColors.selectedTextColor,
        fontSize: FontSize.s12,
      ),
      bodyLarge: getRegularStyle(
        color: AppColors.descriptionTextColor,
        fontSize: FontSize.s14,
      ),
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
  );
}
