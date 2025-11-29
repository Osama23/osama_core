import '../values/app_colors.dart';
import '../values/app_string_constants.dart';
import 'package:flutter/material.dart';

//This class methods return the TextStyle object with specific font weight and other styles.
class FontFamilyStyle {
  FontFamilyStyle._();
  static TextStyle standardTextStyleW500({
    required double fontSize,
    Color color = AppColors.color000000,
    TextDecoration decoration = TextDecoration.none,
    double lineHeight = 1.25,
  }) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.kDinNext,
        decoration: decoration,
        fontSize: fontSize,
        height: lineHeight,
        letterSpacing: 0.0,
      );

  static TextStyle standardTextStyleW700(
          {required double fontSize,
          Color color = AppColors.color000000,
          TextDecoration decoration = TextDecoration.none,
          double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.kDinNext,
        fontSize: fontSize,
        decoration: decoration,
        letterSpacing: 0.0,
        height: lineHeight,
      );

  static TextStyle standardTextStyleW400(
          {required double fontSize,
          Color color = AppColors.color909090,
          TextDecoration decoration = TextDecoration.none,
          double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.kDinNext,
        decoration: decoration,
        fontSize: fontSize,
        letterSpacing: 0.0,
        height: lineHeight,
      );

  static TextStyle standardTextStyleW600(
          {required double fontSize,
          Color color = AppColors.color000000,
          TextDecoration decoration = TextDecoration.none,
          double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.kDinNext,
        fontSize: fontSize,
        decoration: decoration,
        height: lineHeight,
        letterSpacing: 0.0,
      );

  static TextStyle standardTextStyleW300(
          {required double fontSize,
          Color color = AppColors.color909090,
          TextDecoration decoration = TextDecoration.none,
          double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        fontFamily: FontFamily.kDinNext,
        fontSize: fontSize,
        decoration: decoration,
        letterSpacing: 0.0,
        height: lineHeight,
      );
}
