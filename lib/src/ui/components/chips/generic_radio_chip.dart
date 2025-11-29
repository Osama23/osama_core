import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osama_core/src/helpers/extenstions/list_extension.dart';
import 'package:osama_core/osama_core.dart';

class GenericRadioChip extends StatelessWidget {
  const GenericRadioChip({
    super.key,
    required this.onTap,
    required this.label,
    required this.isSelected,
    this.boldTextEffect = false,
    this.isMultiSelection = false,
    this.padding,
    this.iconAlignment = IconAlignment.end,
    this.selectedColor,
    this.image,
    this.backgroundItemHoverEffect = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isMultiSelection;
  final bool boldTextEffect;
  final EdgeInsets? padding;
  final IconAlignment iconAlignment;
  final Color? selectedColor;
  final bool backgroundItemHoverEffect;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: backgroundItemHoverEffect
            ? isSelected
                ? AppColors.basicBorderColor
                : Colors.transparent
            : Colors.transparent,
        padding: padding ??
            const EdgeInsets.symmetric(vertical: 12, horizontal: 24).w,
        // decoration: BoxDecoration(
        //   // color: isSelected ? AppColors.moreLightSecondaryColor : Colors.white,
        //   // border: Border.all(
        //   //   color: isSelected
        //   //       ? AppColors.secondaryColor
        //   //       : AppColors.lightSecondaryColor,
        //   // ),
        //   // borderRadius: BorderRadius.circular(10.toWidth),
        // ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isMultiSelection)
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
                width: 15.5.w,
                height: 15.5.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4).r,
                  border: Border.all(
                    color: isSelected
                        ? (selectedColor ?? AppColors.secondaryColor)
                        : AppColors.placeHolderColor,
                    width: 1.3,
                  ),
                  color: isSelected
                      ? (selectedColor ?? AppColors.secondaryColor)
                      : Colors.transparent,
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        size: 15,
                        color: Colors.white,
                      )
                    : null,
              )
            else
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
                        ? (selectedColor ?? AppColors.secondaryColor)
                        : AppColors.placeHolderColor,
                    width: 1,
                  ),
                ),
                child: AnimatedScale(
                  scale: isSelected ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedColor ?? AppColors.secondaryColor,
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
                  fontSize: 14.sp,
                  fontWeight: boldTextEffect
                      ? (isSelected ? FontWeight.w500 : FontWeight.w400)
                      : FontWeight.w400,
                  color: AppColors.mainText,
                ),
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
                child: Text(
                  label,
                ),
              ),
            ),
            if(image != null)
            SvgPicture.asset(
              image!,
              width: 24.w,
              color: isSelected
                  ? (selectedColor ?? AppColors.secondaryColor)
                  : AppColors.secondText,
            )
          ].reverse(iconAlignment == IconAlignment.end),
        ),
      ),
    );
  }
}
