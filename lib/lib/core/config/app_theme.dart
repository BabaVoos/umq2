import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_palette.dart';
import 'text_styles_manager.dart';

class AppTheme {
  static ThemeData light = ThemeData.dark().copyWith(
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppPalette.primaryLight),
    scaffoldBackgroundColor: AppPalette.background,
    textTheme: TextTheme(
      headlineLarge: TextStylesManager.headLineLarge,
      headlineMedium: TextStylesManager.headLineMedium,
      titleLarge: TextStylesManager.titleLarge,
      titleMedium: TextStylesManager.titleMedium,
      titleSmall: TextStylesManager.titleSmall,
      bodyMedium: TextStylesManager.bodyMedium,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppPalette.background,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: AppPalette.blackColor,
        size: 28,
      ),
      titleTextStyle: TextStylesManager.titleLarge.copyWith(fontSize: 20.sp),
    ),
    inputDecorationTheme: const InputDecorationTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPalette.primaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
      ),
    ),
  );
}
