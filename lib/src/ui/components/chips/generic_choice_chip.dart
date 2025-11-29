import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:osama_core/osama_core.dart';

class GenericChoiceChip extends StatelessWidget {
  const GenericChoiceChip({super.key, required this.onTap, required this.label, required this.isSelected});

  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.moreLightSecondaryColor
              : Colors.white,
          border: Border.all(
            color: isSelected
                ? AppColors.secondaryColor
                : AppColors.lightSecondaryColor,
          ),
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              height: 18.w,
              width: 18.w,
              margin: const EdgeInsets.all(3),
              duration: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
              padding: const EdgeInsets.all(4.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.secondaryColor
                      : AppColors.placeHolderColor,
                  width: 1,
                ),
              ),
              child: AnimatedScale(
                scale: isSelected
                    ? 1
                    : 0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.color6263AB,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: AnimatedDefaultTextStyle(
                style: context.textTheme.labelSmall!.copyWith(
                  fontSize: 12.sp,
                  fontWeight: isSelected
                      ? FontWeight.w700
                      : FontWeight.w400,
                  color: isSelected
                      ? AppColors.mainText
                      : AppColors.secondText,
                ),
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
                child: Text(
                  label,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
