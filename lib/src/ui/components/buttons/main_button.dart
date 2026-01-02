import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osama_core/osama_core.dart';

enum MainButtonStyle { primary, secondary, outline }

enum ButtonIconAligment { prefix, suffix }

class MainButton extends StatelessWidget {
  const MainButton({
    super.key = const Key("MainButton"),
    this.onTap,
    required this.buttonStyle,
    this.isLoading = false,
    required this.text,
    this.borderRadius,
    this.width,
    this.height,
    this.backgroundColor,
    this.iconPath,
    this.textStyle,
    this.isEnabled = true,
    this.iconColor,
    this.border,
    this.padding,
    this.iconSize,
    this.hasBorder = false,
    this.iconAligment = ButtonIconAligment.prefix,
    this.borderColor,
    this.textColor,
    this.borderWidth,
  });

  final VoidCallback? onTap;
  final MainButtonStyle buttonStyle;
  final bool isLoading;
  final String text;
  final double? borderRadius;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final String? iconPath;
  final TextStyle? textStyle;
  final bool isEnabled;
  final Color? iconColor;
  final BorderSide? border;
  final EdgeInsetsGeometry? padding;
  final double? iconSize;
  final bool hasBorder;
  final ButtonIconAligment iconAligment;
  final Color? borderColor;
  final Color? textColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      key: const Key("MainButtonMaterialButton"),
      onPressed: isEnabled ? onTap : null,
      elevation: 0,
      padding:
      padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: backgroundColor ?? _backgroundColor(),
      disabledColor: backgroundColor ?? AppColors.color4C4C4C,
      height: height,
      minWidth: width ?? double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 14),
        side: border ??
            (buttonStyle == MainButtonStyle.outline
                ? BorderSide(
              color: onTap != null
                  ? borderColor ?? AppColors.secondaryColor
                  : borderColor ?? AppColors.secondText,
              width: borderWidth ?? 1,
            )
                : BorderSide.none),
      ),
      child: isLoading
          ? SizedBox(
        width: 21.w,
        height: 21.w,
        child: const CircularProgressIndicator.adaptive(
          key: Key("MainButtonProgressIndicator"),
        ),
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPath != null && iconAligment == ButtonIconAligment.prefix) ...[
            SvgPicture.asset(
              iconPath!,
              height: iconSize ?? 21.w,
              width: iconSize,
              key: const Key("MainButtonIcon"),
              colorFilter: ColorFilter.mode(
                onTap != null
                    ? iconColor ?? AppColors.basicBorderColor
                    : AppColors.basicBorderColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(
              key: const Key("MainButtonSize"),
              width: 8.w,
            ),
          ],
          Flexible(
            child: AutoSizeText(
              text,
              key: const Key("MainButtonAutoSizeText"),
              style: textStyle ??
                  context.textTheme.labelSmall?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                          color: isEnabled && onTap != null
                              ? textColor ?? _textColor()
                              : AppColors.white,
                          height: 21 / 14,
                        ),
                    minFontSize: 4,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
                if (iconPath != null && iconAligment == ButtonIconAligment.suffix) ...[
                  SizedBox(
                    key: const Key("MainButtonSize"),
                    width: 8.w,
                  ),
                  SvgPicture.asset(
                    iconPath!,
                    height: iconSize ?? 21.w,
                    width: iconSize,
                    key: const Key("MainButtonIcon"),
                    colorFilter: ColorFilter.mode(
                      onTap != null
                          ? iconColor ?? AppColors.basicBorderColor
                          : AppColors.basicBorderColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ],
            ),
    );
  }

  Color _backgroundColor() {
    switch (buttonStyle) {
      case MainButtonStyle.primary:
        return AppColors.secondaryColor;
      case MainButtonStyle.secondary:
        return AppColors.lightSecondaryColor;
      case MainButtonStyle.outline:
        return Colors.transparent;
    }
  }

  Color _textColor() {
    switch (buttonStyle) {
      case MainButtonStyle.primary:
        return Colors.white;
      case MainButtonStyle.secondary:
        return AppColors.secondaryColor;
      case MainButtonStyle.outline:
        return AppColors.secondaryColor;
    }
  }
}