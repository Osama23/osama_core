import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:osama_core/osama_core.dart';

class SquaredChoiceChip extends StatelessWidget {
  const SquaredChoiceChip({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    this.fixedSize = true,
    this.description,
    this.padding,
  });

  final String label;
  final String icon;
  final String? description;
  final bool isSelected;
  final VoidCallback onTap;
  final bool fixedSize;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        width: fixedSize ? 88.w : null,
        height: fixedSize ? 88.w : null,
        padding: padding ?? EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.moreLightSecondaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.secondaryColor
                : AppColors.basicBorderColor,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: description != null
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              icon.endsWith('.svg')
                  ? SvgPicture.network(
                      icon,
                      colorFilter: ColorFilter.mode(
                        isSelected
                            ? AppColors.secondaryColor
                            : AppColors.mainText,
                        BlendMode.srcIn,
                      ),
                      height: 32.h,
                      fit: BoxFit.fitHeight,
                    )
                  : ImageView(
                      icon,
                      ImageType.url,
                      height: 32.h,
                      imageColor: isSelected
                          ? AppColors.secondaryColor
                          : AppColors.mainText,
                      fit: BoxFit.cover,
                    ),
              SizedBox(
                height: 8.h,
              ),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                curve: Curves.fastOutSlowIn,
                style: AppFonts.bodyMedium12px.copyWith(
                  color: isSelected
                      ? AppColors.secondaryColor
                      : AppColors.mainText,
                ),
                child: Text(
                  label,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
              if (description != null) ...[
                SizedBox(height: 2.h),
                Text(
                  description!,
                  style: AppFonts.bodyRegular11px.secondTextColor,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
