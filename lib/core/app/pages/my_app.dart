import 'package:flutter/material.dart';
import 'package:threads/core/config/config.dart';
import 'package:threads/features/thread/presentation/home/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.cultured,
        hintColor: AppColors.davyGrey,
        dividerColor: AppColors.darkCharcoal,
        secondaryHeaderColor: AppColors.sonicSilver,
        colorScheme: const ColorScheme.dark(
          secondary: AppColors.lotion,
          secondaryFixed: AppColors.chineseSilver,
          error: AppColors.red,
        ),
        cupertinoOverrideTheme: AppTheme.darkTheme,
      ),
      scrollBehavior: const ScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
      ),
      home: const HomePage(),
    );
  }
}
