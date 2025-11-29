import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osama_core/osama_core.dart';

class ContactTabCard extends StatelessWidget {
  const ContactTabCard({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    this.subtitle,
    this.titleTextSpan,
  });

  final VoidCallback onTap;
  final String icon;
  final String title;
  final String? subtitle;
  final List<TextSpan>? titleTextSpan;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22).w,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(
            color: AppColors.basicBorderColor,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularIconWithBackground(
              icon: icon,
              size: 44.w,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: title,
                      style: context.textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainText,
                      height: 21 / 14.sp,
                    ),
                      children: titleTextSpan,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle!,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: AppColors.secondText,
                      fontSize: 12.sp,
                      height: 15.6 / 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            SvgPicture.asset(
              "assets/svg/chevern-left.svg",
              width: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
