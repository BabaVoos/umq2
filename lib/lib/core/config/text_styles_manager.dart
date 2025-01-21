import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_palette.dart';

class TextStylesManager {
  static TextStyle headLineLarge = GoogleFonts.inter(
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    color: AppPalette.textPrimaryLight,
  );

  static TextStyle headLineMedium = GoogleFonts.inter(
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
    color: AppPalette.textLightBlue,
  );

  static TextStyle titleLarge = GoogleFonts.inter(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppPalette.textBlack,
  );

  static TextStyle titleMedium = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppPalette.textPrimary,
  );

  static TextStyle titleSmall = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppPalette.textGrey,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppPalette.textLightBlue,
  );
}
