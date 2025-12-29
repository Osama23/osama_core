import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';

class GenericAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GenericAppBar({
    required this.title,
    super.key,
    this.leading,
    this.trailing,
    this.actions,
    this.fontSize,
    this.titleWidget,
    this.backgroundColor,
    this.textColor,
    this.hasBottomBorder = false,
    this.systemOverlayStyle,
    this.backButtonColor,
    this.bottomWidget,
    this.elevation,
    this.englishLangEnabled = false,
  });

  final String title;
  final Widget? leading;
  final Widget? trailing;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final double? fontSize;
  final Color? backgroundColor;
  final bool hasBottomBorder;
  final Color? textColor;
  final Color? backButtonColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final PreferredSizeWidget? bottomWidget;
  final double? elevation;
  final bool englishLangEnabled;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.mainPrimary,
      elevation: elevation ?? 0,
      automaticallyImplyLeading: true,
      centerTitle: true,
      shape: hasBottomBorder ? const Border(
          bottom: BorderSide(
            color: AppColors.basicBorderColor,
            width: 1,
          ),
      ) : null,
      actions: actions ?? [
        if(trailing != null)
          Container(
            margin: const EdgeInsetsDirectional.only(end: 18),
            child: trailing,
          ),
      ],
      bottom: bottomWidget,
      leading: leading ?? Container(
        margin: const EdgeInsetsDirectional.only(start: 24),
        child: AppBackButton(
          backgroundColor: backButtonColor,
          englishLangEnabled: englishLangEnabled,
        ),
      ),
      leadingWidth: 57.w,
      title: titleWidget ?? Text(
        title,
        textAlign: TextAlign.center,
        style: context.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w700,
          color: textColor ?? AppColors.mainText,
          height: 24 / 16,
          fontSize: fontSize,
        ),
      ),
      systemOverlayStyle: systemOverlayStyle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottomWidget?.preferredSize.height ?? 0) + 4);
}
