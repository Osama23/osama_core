import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';

class CommonBottomSheet extends StatelessWidget {
  final double height;
  final String title;
  final String content;
  final VoidCallback onTap;
  final VoidCallback? onTapNo;
  final String primaryButtonText;

  const CommonBottomSheet({
    required this.height,
    required this.title,
    required this.content,
    required this.onTap,
    required this.primaryButtonText,
    this.onTapNo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.colorFFFFFF,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.w),
          topRight: Radius.circular(24.w),
        ),
      ),
      child: Padding(
        padding: AppDimensions.onlyL24R24T24B30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 24.sp,
                color: AppColors.color000000,
              ),
            ),
            SizedBox(height: 21.h),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.color000000,
                height: 1.5,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CommonOutlineButton(
                    onPress:
                        onTapNo ??
                        () {
                          Navigator.pop(context);
                        },
                    text: context.l10n.cancel,
                    width: 10.w,
                    height: 44.h,
                    backgroundColor: AppColors.colorFFFFFF,
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.color909090,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                SizedBox(width: 11.w),
                Expanded(
                  child: CommonCurvedButton(
                    onPress: onTap,
                    text: primaryButtonText,
                    width: 10.w,
                    height: 44.h,
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.colorFFFFFF,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SingleButtonCommonBottomSheet extends StatelessWidget {
  final double height;
  final String? title;
  final String content;
  final VoidCallback? onTap;
  final String primaryButtonText;

  const SingleButtonCommonBottomSheet({
    required this.height,
    required this.primaryButtonText,
    required this.content,
    this.title,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.colorFFFFFF,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.w),
          topRight: Radius.circular(24.w),
        ),
      ),
      child: Padding(
        padding: AppDimensions.onlyL24R24T24B30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 24.sp,
                      color: AppColors.color000000,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
              SizedBox(height: 21.h),
            ],
            Text(
              content,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.color000000,
                height: 1.5,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CommonCurvedButton(
                    onPress:
                        onTap ??
                        () {
                          Navigator.pop(context);
                        },
                    text: primaryButtonText,
                    width: 10.w,
                    height: 44.h,
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.colorFFFFFF,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
