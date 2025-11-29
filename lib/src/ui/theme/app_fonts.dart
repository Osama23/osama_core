import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';

class AppFonts {
  const AppFonts._();
// Define the reusable text styles for your design system
  static TextStyle headingRegular18px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 18.0.sp,
    fontWeight: FontWeight.normal,
    height: 27 / 18.sp,
  );

  static TextStyle headingRegular22px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 22.0.sp,
    fontWeight: FontWeight.normal,
    height: 28.6 / 22.sp,
  );

  static TextStyle headingRegular25px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 25.0.sp,
    fontWeight: FontWeight.normal,
    height: 32.5 / 25.sp,
  );

  static TextStyle headingRegular28px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 28.0.sp,
    fontWeight: FontWeight.normal,
    height: 36.4 / 28.sp,
  );

  static TextStyle headingBold18px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 18.0.sp,
    fontWeight: FontWeight.bold,
    height: 27 / 18.sp,
  );

  static TextStyle headingBold22px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 22.0.sp,
    fontWeight: FontWeight.bold,
    height: 28.6 / 22.sp,
  );

  static TextStyle headingBold25px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 25.0.sp,
    fontWeight: FontWeight.bold,
    height: 32.5 / 25.sp,
  );

  static TextStyle headingBold28px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 28.0.sp,
    fontWeight: FontWeight.bold,
    height: 36.4 / 28.sp,
  );

  static TextStyle bodyRegular12px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 12.0.sp,
    fontWeight: FontWeight.normal,
    height: 15.6 / 12.sp,
  );

  static TextStyle bodyRegular11px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 11.0.sp,
    fontWeight: FontWeight.normal,
    height: 16.5 / 12.sp,
  );

  static TextStyle bodyRegular8px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 8.0.sp,
    fontWeight: FontWeight.normal,
    height: 16.5 / 12.sp,
  );

  static TextStyle bodyRegular14px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 14.0.sp,
    fontWeight: FontWeight.normal,
    height: 21 / 14.sp,
  );

  static TextStyle bodyRegular16px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.normal,
    height: 24 / 16.sp,
  );

  static TextStyle bodyMedium11px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 11.0.sp,
    fontWeight: FontWeight.w500,
    height: 14.3 / 11.sp,
  );

  static TextStyle bodyMedium12px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w500,
    height: 15.6 / 12.sp,
  );

  static TextStyle bodyMedium14px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w500,
    height: 21 / 14.sp,
  );

  static TextStyle bodyMedium16px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w500,
    height: 20.8 / 16.sp,
  );

  static TextStyle bodyBold11px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 11.0.sp,
    fontWeight: FontWeight.bold,
    height: 14.3 / 11.sp,
  );

  static TextStyle bodyBold12px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 12.0.sp,
    fontWeight: FontWeight.bold,
    height: 18 / 12.sp,
  );

  static TextStyle bodyBold14px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 14.0.sp,
    fontWeight: FontWeight.bold,
    height: 21 / 14.sp,
  );

  static TextStyle bodyBold16px = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.bold,
    height: 24 / 16.sp,
  );
}

extension AppTextStyleUtils on TextStyle {
  TextStyle get mainTextColor => copyWith(color: AppColors.mainText);

  TextStyle get secondTextColor => copyWith(color: AppColors.secondText);
}
