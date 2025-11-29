import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:osama_core/osama_core.dart';

class IconTextColumn extends StatelessWidget {
  const IconTextColumn({required this.text, required this.icon, super.key});
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       icon,
        SizedBox(
          height: 2.h,
        ),
        Text(
          text,
          style: FontFamilyStyle.standardTextStyleW500(
              fontSize: 12.sp,
              lineHeight: 17.52 / 12,
              color: AppColors.colorFFFFFF),
        )
      ],
    );
  }
}