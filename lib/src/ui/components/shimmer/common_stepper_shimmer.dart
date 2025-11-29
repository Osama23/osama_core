import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:osama_core/osama_core.dart';
import 'package:shimmer/shimmer.dart';

class CommonStepperShimmer extends StatelessWidget {
  const CommonStepperShimmer({super.key});


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.colorE0E0E0,
      enabled: true,
      highlightColor: AppColors.colorFFFFFF,
      child: Container(
        height: 16.h,
        width: 70.w,
        decoration: BoxDecoration(
            color: AppColors.colorFFFFFF,
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
