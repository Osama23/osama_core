import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:osama_core/osama_core.dart';

class CommonDivider extends StatelessWidget {
  final double? height;
  final Color? color;
  const CommonDivider({this.height,this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 1.h,
      color: color ?? AppColors.colorF2F2F2,
    );
  }
}
