import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:osama_core/osama_core.dart';

class RadioButtonCircularIcon extends StatelessWidget {
  const RadioButtonCircularIcon({
    super.key,
    required this.isSelected,
    required this.icon,
  });

  final bool isSelected;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 32.w,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.secondaryColor
            : AppColors.lightSecondaryColor,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        icon,
        fit: BoxFit.fill,
        width: double.infinity,
        // color: isSelected ? Colors.white : AppColors.secondaryColor,
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.white : AppColors.secondaryColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
