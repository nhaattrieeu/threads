import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads/core/config/config.dart';

class AppTheme {
  static const CupertinoThemeData darkTheme = CupertinoThemeData(
    primaryColor: AppColors.cultured,
    scaffoldBackgroundColor: AppColors.chineseBlack,
    barBackgroundColor: AppColors.chineseBlack,
  );

  static ThemeData darkColorScheme = ThemeData(
    dividerColor: AppColors.darkCharcoal,
    colorScheme: const ColorScheme.dark(
      secondary: AppColors.lotion,
    ),
  );

  static TextStyle firstThreadTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 12.8,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).secondaryHeaderColor,
    );
  }

  static TextStyle usernameTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 14.5,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  static TextStyle timeTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 14.5,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).secondaryHeaderColor,
    );
  }

  static TextStyle contentTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 14.5,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).primaryColor,
      height: 1.5,
    );
  }

  static TextStyle toolBarTextStyle(BuildContext context, Color color) {
    return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }
}
