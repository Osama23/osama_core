// This is a container which contains icon and text with yellow circular border.

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:osama_core/osama_core.dart';

class TextIconContainer extends StatelessWidget {
  final String text;
  final double? height;
  final bool isTextInside;
  final Widget icon;
  final double radius;
  final double borderWidth;
  final bool isSelected;
  final Color? backgroundColor;
  const TextIconContainer({required this.text, required this.icon, this.height,this.isSelected=false,this.radius=6, this.borderWidth = 1,this.isTextInside=true,this.backgroundColor,super.key});

  @override
  Widget build(BuildContext context) {
    return isTextInside
        ? Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
            height: height ?? 70.h,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(radius.w),
              border: Border.all(color: isSelected?AppColors.colorEBDD36:Colors.white),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                icon,
                Flexible(
                  child: AutoSizeText(
                    text,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: height ?? 70.h,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(radius.h),
                  border: Border.all(color: isSelected?AppColors.colorEBDD36:Colors.white, width: borderWidth),
                ),
                child: Center(
                    child: icon
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 14.sp),
                textAlign: TextAlign.center,
              ),
            ],
          );
  }
}
