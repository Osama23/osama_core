import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osama_core/osama_core.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key = const Key("AppBackButton"),
    this.onTap,
    this.backgroundColor,
    this.borderColor,
  });

  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key("AppBackButtonContainer"),
      height: 36.h,
      width: 36.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? AppColors.colorFFFFFF,
        border: Border.all(
          color: borderColor ?? AppColors.basicBorderColor,
        ),
      ),
      child: InkWell(
        key: const Key("AppBackButtonInkWell"),
        onTap: onTap ??
            () {
              Navigator.pop(context);
            },
        child: Center(
          child: SvgPicture.asset(
            key: const Key("AppBackButtonSvgIcon"),
            "assets/svg/ic_back_arrow.svg",
            width: 16.w,
            height: 16.w,
          ),
        ),
      ),
    );
  }
}
