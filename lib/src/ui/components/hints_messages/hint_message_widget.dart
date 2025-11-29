import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osama_core/osama_core.dart';

class HintMessageWidget extends StatelessWidget {
  const HintMessageWidget({
    super.key,
    required this.text,
    this.onClose,
    this.action,
    this.backgroundColor,
    this.hasPrefixIcon = true,
    this.iconColor,
    this.contentPadding,
  });

  final List<InlineSpan> text;
  final VoidCallback? onClose;
  final Widget? action;
  final bool hasPrefixIcon;
  final Color? backgroundColor;
  final Color? iconColor;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: contentPadding ?? const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.lightWarningColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasPrefixIcon) ...[
            SvgPicture.asset(
              CoreAppSvg.mapWarning,
              height: 15.h,
              width: 15.w,
              colorFilter: iconColor == null
                  ? null
                  : ColorFilter.mode(
                      iconColor!,
                      BlendMode.srcIn,
                    ),
            ),
            SizedBox(width: onClose != null ? 4.w : 10.w),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: context.textTheme.labelSmall?.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.color1C1B13,
                    ),
                    children: text,
                  ),
                ),
                if (action != null) action!,
              ],
            ),
          ),
          if (onClose != null) ...[
            SizedBox(width: 4.w),
            InkWell(
              onTap: onClose,
              child: const Icon(
                Icons.close_outlined,
                size: 22,
                color: AppColors.mainText,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
