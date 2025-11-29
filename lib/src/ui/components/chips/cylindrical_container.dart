// Its a common widget of a container in cylindrical shape

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osama_core/osama_core.dart';

class CylindricalContainer extends StatelessWidget {
  final String text;
  final Color? color;
  final double? width;
  final Color? textColor;
  final double? radius;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final String? icon;

  const CylindricalContainer({
    required this.text,
    this.color,
    this.width,
    this.textColor,
    this.textStyle,
    this.padding,
    this.radius,
    this.margin,
    super.key,
    this.height,
    this.borderRadiusGeometry,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 21.h,
      margin: margin,
      padding: padding ?? AppDimensions.symmetricH12,
      decoration: BoxDecoration(
        color: color ?? AppColors.colorEBDD36,
        borderRadius: borderRadiusGeometry ??
            BorderRadius.circular(
              radius ?? 6.w,
            ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            SvgPicture.asset(
              icon!,
              width: 14.w,
            ),
            SizedBox(width: 4.w),
          ],
          AutoSizeText(
            text,
            style: textStyle ??
                Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                      color: textColor ?? AppColors.color000000,
                    ),
            maxLines: 1,
            minFontSize: 4,
          ),
        ],
      ),
    );
  }
}
