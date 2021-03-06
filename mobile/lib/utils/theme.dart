import 'package:flutter/material.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/utils.dart';

ThemeData buildThemeData() {
  final baseTheme = ThemeData(fontFamily: AppFonts.primaryFont);

  return baseTheme.copyWith(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    appBarTheme: AppBarTheme(
      color: AppColors.appBarColor,
      elevation: 0,
    ),
  );
}