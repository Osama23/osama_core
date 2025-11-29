import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:osama_core/osama_core.dart';

class CurvedImageAsset extends StatelessWidget {
  const CurvedImageAsset({required this.width,required this.height,required this.path, this.borderWidth = 2, this.isSelected = false, this.radius=10,super.key});
  final double radius;
  final String path;
  final double height;
  final double width;
  final bool isSelected;
  final double borderWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius.w)),
        border: Border.all(color: isSelected ? AppColors.color6263AB : Colors.transparent, width: borderWidth)
      ),
      child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.all(Radius.circular((radius - 1).w)),
          child: Image.asset(path,height: 72.h,width: 72.w,fit: BoxFit.cover)),);
  }
}
