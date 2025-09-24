import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/theming/colors_manager.dart';
import 'package:task_manager/core/theming/font_weight_helper.dart';

// Defines all the text styles used in the app for consistency.
abstract class AppStyles {
  // Style for primary headings (e.g., screen titles on light backgrounds).
  static TextStyle h1 = GoogleFonts.inter(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.primary,
  );

  // Style for secondary headings, often used in headers with dark backgrounds.
  static TextStyle h2 = GoogleFonts.inter(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.white,
  );

  // Style for tertiary headings.
  static TextStyle h3 = GoogleFonts.inter(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.foreground,
  );

  // Style for card titles. This is crucial for the TaskCard widget.
  static TextStyle cardTitle = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.foreground,
  );

  // Style for paragraphs and longer text blocks.
  static TextStyle p = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.foreground,
  );

  // Style for text within buttons.
  static TextStyle button = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.primaryForeground,
  );

  // Style for smaller, secondary text.
  static TextStyle smallText = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.mutedForeground,
  );

  // Style for the smallest text elements, like captions or badges.
  static TextStyle extraSmallText = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.mutedForeground,
  );
}
