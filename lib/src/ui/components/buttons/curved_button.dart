// Common curved button

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osama_core/osama_core.dart';

class CommonCurvedButton extends StatefulWidget {
  const CommonCurvedButton({
    this.height = 40, // 1.h,
    required this.width,
    required this.text,
    required this.onPress,
    this.backgroundColor,
    this.textStyle,
    this.borderRadius = 14,
    this.isEnabled = true,
    this.isLoading = false,
    this.iconColor,
    this.iconPath,
    super.key,
    this.border = const BorderSide(color: Colors.transparent),
    this.padding,
    this.iconSize,
    this.leadingIconPath,
    this.intervalMs = 0, // Safe tap interval
  });
  final VoidCallback? onPress;
  final String text;
  final double borderRadius;
  final double width;
  final double height;
  final Color? backgroundColor;
  final String? iconPath;
  final TextStyle? textStyle;
  final bool isEnabled;
  final Color? iconColor;
  final BorderSide border;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;
  final double? iconSize;
  final String? leadingIconPath;
  final int intervalMs; // Time interval to prevent rapid taps

  @override
  State<CommonCurvedButton> createState() => _CommonCurvedButtonState();
}

class _CommonCurvedButtonState extends State<CommonCurvedButton> {
  int _lastTimeClicked = 0; // Tracks the last tap time

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        splashFactory: InkSplash.splashFactory,
        overlayColor: WidgetStateProperty.all<Color>(
          widget.isEnabled
              ? Theme.of(context).primaryColorLight.withValues(alpha: 0.3)
              : AppColors.colorF0F0EF,
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          widget.isEnabled
              ? widget.backgroundColor ?? Theme.of(context).primaryColor
              : AppColors.colorF0F0EF,
        ),
        minimumSize: WidgetStateProperty.all<Size>(
          Size(widget.width, widget.height),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: widget.border,
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
          ),
        ),
        padding:
            widget.padding != null
                ? WidgetStateProperty.all<EdgeInsetsGeometry>(widget.padding!)
                : null,
      ),
      onPressed:
          widget.isEnabled
              ? () {
                final int now = DateTime.now().millisecondsSinceEpoch;
                if (now - _lastTimeClicked < widget.intervalMs) {
                  return; // Ignore if tapped within interval
                }
                _lastTimeClicked = now;
                widget.onPress?.call(); // Execute onPress
              }
              : null,
      child:
          widget.isLoading
              ? const CircularProgressIndicator.adaptive()
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.iconPath != null)
                    SvgPicture.asset(
                      widget.iconPath!,
                      height: widget.iconSize ?? 22.h,
                      width: widget.iconSize,
                      // fit: BoxFit.scaleDown,
                      colorFilter:
                          widget.iconColor == null
                              ? null
                              : ColorFilter.mode(
                                widget.iconColor!,
                                BlendMode.srcIn,
                              ),
                    )
                  else
                    const SizedBox.shrink(),
                  if (widget.iconPath != null)
                    SizedBox(width: 4.w)
                  else
                    const SizedBox.shrink(),
                  Flexible(
                    child: AutoSizeText(
                      widget.text,
                      style: widget.textStyle,
                      minFontSize: 4,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (widget.leadingIconPath != null)
                    SizedBox(width: 8.w)
                  else
                    const SizedBox.shrink(),
                  if (widget.leadingIconPath != null)
                    SvgPicture.asset(
                      widget.leadingIconPath!,
                      height: widget.iconSize ?? 22.h,
                      width: widget.iconSize,
                      // fit: BoxFit.scaleDown,
                      colorFilter:
                          widget.iconColor == null
                              ? null
                              : ColorFilter.mode(
                                widget.iconColor!,
                                BlendMode.srcIn,
                              ),
                    )
                  else
                    const SizedBox.shrink(),
                ],
              ),
    );
  }
}

/// Common curved button with borders
class CommonOutlineButton extends StatelessWidget {
  const CommonOutlineButton({
    required this.height,
    required this.width,
    required this.text,
    required this.onPress,
    this.backgroundColor,
    this.textStyle,
    this.iconPath,
    this.borderRadius = 14,
    this.borderColor,
    this.textColor,
    this.isEnabled = true,
    super.key,
    this.borderWidth,
  });
  final VoidCallback onPress;
  final String text;
  final double borderRadius;
  final double width;
  final double height;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final String? iconPath;
  final Color? borderColor;
  final Color? textColor;
  final bool isEnabled;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        splashFactory: InkSplash.splashFactory,
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColorLight,
        minimumSize: Size(width, height),
        side: BorderSide(
          color:
              isEnabled
                  ? borderColor ?? AppColors.color6C6DB5
                  : AppColors.color807F7B,
          width: borderWidth ?? 2.w,
          style: BorderStyle.solid,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
      onPressed: isEnabled ? onPress : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPath != null)
            MirrorWidget(
              child: SvgPicture.asset(
                iconPath!,
                height: 24.h,
                fit: BoxFit.scaleDown,
              ),
            )
          else
            const SizedBox.shrink(),
          if (iconPath != null)
            SizedBox(width: 8.w)
          else
            const SizedBox.shrink(),
          Flexible(
            child: AutoSizeText(
              text,
              style:
                  textStyle ??
                  Theme.of(context).textTheme.titleLarge!.copyWith(
                    color:
                        isEnabled
                            ? textColor ?? Theme.of(context).primaryColor
                            : Colors.grey[400],
                    fontSize: 18.sp,
                  ),
              minFontSize: 4,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class CommonIconButton extends StatelessWidget {
  const CommonIconButton({
    this.height = 40, // 1.h,
    required this.width,
    required this.text,
    required this.onPress,
    this.backgroundColor,
    this.textStyle,
    this.borderRadius = 14,
    this.isEnabled = true,
    this.iconColor,
    this.iconPath,
    super.key,
    this.border = const BorderSide(color: Colors.transparent),
  });
  final VoidCallback onPress;
  final String text;
  final double borderRadius;
  final double width;
  final double height;
  final Color? backgroundColor;
  final String? iconPath;
  final TextStyle? textStyle;
  final bool isEnabled;
  final Color? iconColor;
  final BorderSide border;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        splashFactory: InkSplash.splashFactory,
        overlayColor: WidgetStateProperty.all<Color>(
          isEnabled
              ? Theme.of(context).primaryColorLight.withValues(alpha: 0.3)
              : Colors.grey[400]!,
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          isEnabled
              ? backgroundColor ?? Theme.of(context).primaryColor
              : Colors.grey[400]!,
        ),
        minimumSize: WidgetStateProperty.all<Size>(Size(width, height)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: border,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
      ),
      onPressed: isEnabled ? onPress : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          //iconPath != null ? MirrorWidget(child: SvgPicture.asset(iconPath!, height: 24.h, fit: BoxFit.scaleDown, color: iconColor,)) : SizedBox.shrink(),
          if (iconPath != null)
            SvgPicture.asset(
              iconPath!,
              height: 24.h,
              fit: BoxFit.scaleDown,
              colorFilter:
                  iconColor == null
                      ? null
                      : ColorFilter.mode(iconColor!, BlendMode.srcIn),
              // color: iconColor,
            )
          else
            const SizedBox.shrink(),
          if (iconPath != null)
            SizedBox(width: 8.w)
          else
            const SizedBox.shrink(),
          Flexible(
            child: AutoSizeText(
              text,
              style: textStyle,
              minFontSize: 4,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class SafeCurvedButton extends StatefulWidget {
  const SafeCurvedButton({
    this.height = 40, // 1.h,
    this.width,
    required this.text,
    required this.onPress,
    this.backgroundColor,
    this.textStyle,
    this.borderRadius = 14,
    this.isEnabled = true,
    this.isLoading = false,
    this.iconColor,
    this.iconPath,
    this.intervalMs = 500,
    super.key,
    this.border = const BorderSide(color: Colors.transparent),
    this.padding,
    this.title,
  });
  final VoidCallback? onPress;
  final String text;
  final double borderRadius;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final String? iconPath;
  final TextStyle? textStyle;
  final int intervalMs;
  final bool isEnabled;
  final Color? iconColor;
  final BorderSide border;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;
  final Widget? title;

  @override
  State<SafeCurvedButton> createState() => _SafeCurvedButtonState();
}

class _SafeCurvedButtonState extends State<SafeCurvedButton> {
  int lastTimeClicked = 0;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        splashFactory: InkSplash.splashFactory,
        overlayColor: WidgetStateProperty.all<Color>(
          widget.isEnabled
              ? Theme.of(context).primaryColorLight.withValues(alpha: 0.3)
              : AppColors.colorF0F0EF,
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          widget.isEnabled
              ? widget.backgroundColor ?? Theme.of(context).primaryColor
              : AppColors.colorF0F0EF,
        ),
        minimumSize:
            widget.width != null || widget.height != null
                ? WidgetStateProperty.all<Size>(
                  Size(widget.width ?? 0, widget.height ?? 0),
                )
                : null,
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: widget.border,
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
          ),
        ),
        padding:
            widget.padding != null
                ? WidgetStateProperty.all<EdgeInsetsGeometry>(widget.padding!)
                : null,
      ),
      onPressed:
          widget.isEnabled
              ? () {
                final now = DateTime.now().millisecondsSinceEpoch;
                if (now - lastTimeClicked < widget.intervalMs) {
                  return;
                }
                lastTimeClicked = now;
                widget.onPress?.call();
              }
              : null,
      child:
          widget.isLoading
              ? const CircularProgressIndicator.adaptive()
              : widget.title != null
              ? widget.title!
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.iconPath != null)
                    SvgPicture.asset(
                      widget.iconPath!,
                      height: 22.h,
                      fit: BoxFit.scaleDown,
                      colorFilter:
                          widget.iconColor == null
                              ? null
                              : ColorFilter.mode(
                                widget.iconColor!,
                                BlendMode.srcIn,
                              ),
                    )
                  else
                    const SizedBox.shrink(),
                  if (widget.iconPath != null)
                    SizedBox(width: 4.w)
                  else
                    const SizedBox.shrink(),
                  Flexible(
                    child: AutoSizeText(
                      widget.text,
                      style: widget.textStyle,
                      minFontSize: 4,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
    );
  }
}
