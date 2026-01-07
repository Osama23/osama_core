import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:osama_core/osama_core.dart';

class DefaultAppBottomSheet extends StatelessWidget {
  const DefaultAppBottomSheet({
    super.key,
    this.children,
    this.hasDragButton = false,
    this.margin = const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
    this.padding = const EdgeInsets.all(24.0),
    this.appbarPadding = const EdgeInsets.symmetric(horizontal: 0),
    this.borderRadius,
    this.dragButtonSpace,
    this.title,
    this.actions,
    this.safeBottom = false,
    this.closeButtonColor,
    this.onCloseClicked,
    this.backgroundColor = Colors.white,
    this.child,
    this.resizeToAvoidBottomInset = false,
    this.titleFontSize,
    this.titleTextColor,
    this.hasCloseButton = false,
    this.leading,
    this.hasBottomRadius = true,
    this.leadingWidth,
  });

  final VoidCallback? onCloseClicked;
  final List<Widget>? children;
  final bool hasDragButton;
  final bool safeBottom;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final EdgeInsets? appbarPadding;
  final BorderRadiusGeometry? borderRadius;
  final double? dragButtonSpace;
  final String? title;
  final double? titleFontSize;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color? closeButtonColor;
  final Color? titleTextColor;
  final Widget? child;
  final bool resizeToAvoidBottomInset;
  final bool hasCloseButton;
  final Widget? leading;
  final bool hasBottomRadius;
  final double? leadingWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: safeBottom,
      child: Container(
        margin: margin,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: borderRadius ??
              BorderRadius.only(
                topLeft: const Radius.circular(40),
                topRight: const Radius.circular(40),
                bottomLeft:
                    hasBottomRadius ? const Radius.circular(40) : Radius.zero,
                bottomRight:
                    hasBottomRadius ? const Radius.circular(40) : Radius.zero,
              ),
          color: backgroundColor,
        ),
        child: Padding(
          padding: padding.copyWith(
              top: 8,
              bottom: padding.bottom +
                  (resizeToAvoidBottomInset
                      ? MediaQuery.of(context).viewInsets.bottom
                      : 0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasDragButton) ...[
                Container(
                  height: 6.h,
                  width: 82.w,
                  decoration: BoxDecoration(
                      color: AppColors.basicBorderColor,
                      borderRadius: BorderRadius.circular(8)),
                ),
                SizedBox(height: dragButtonSpace ?? 30.h),
              ],
              if (title != null || hasCloseButton)
                Padding(
                  padding: appbarPadding ??
                      const EdgeInsets.symmetric(horizontal: 0),
                  child: AppBar(
                    title: title != null
                        ? Text(
                            title!,
                            style: AppFonts.bodyBold16px.copyWith(
                              fontSize: titleFontSize ?? 16.sp,
                              color: titleTextColor ?? AppColors.primary,
                            ),
                          )
                        : null,
                    backgroundColor: Colors.transparent,
                    actions: actions ??
                        [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              onCloseClicked?.call();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(7.2).w,
                              margin: const EdgeInsets.all(4).w,
                              width: 32.r,
                              height: 32.r,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: closeButtonColor,
                                  border: Border.all(
                                    color: AppColors.basicBorderColor,
                                    width: 1,
                                  )),
                              child: SizedBox(
                                width: 10.w,
                                child: SvgPicture.asset(
                                  "assets/svg/close.svg",
                                  // ignore: deprecated_member_use
                                  color: AppColors.mainText,
                                ),
                              ),
                            ),
                          ),
                        ],
                    leading: leading ?? const SizedBox.shrink(),
                    leadingWidth: leadingWidth ?? (leading != null ? 90.w : null),
                  ),
                ),
              if (children != null) ...children!,
              if (child != null) child!,
            ],
          ),
        ),
      ),
    );
  }
}
