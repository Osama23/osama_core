import 'package:osama_core/osama_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.price,
    this.priceFontSize,
    this.oldPrice,
    this.oldPriceFontSize,
    this.currencyFontWeight,
    this.textColor,
    this.isDiscount = false, 
    this.priceFontWeight, 
    this.lineHight,
  });

  final String price;
  final String? oldPrice;
  final double? priceFontSize;
  final double? oldPriceFontSize;
  final FontWeight? priceFontWeight;
  final FontWeight? currencyFontWeight;
  final Color? textColor;
  final bool isDiscount;
  final double? lineHight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          price,
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: priceFontWeight ?? FontWeight.w500,
            fontSize: priceFontSize ?? 16.sp,
            color: textColor ?? Colors.black,
            height: lineHight,
          ),
          maxLines: 1,
        ),
        if (oldPrice != null) ...[
          SizedBox(width: 4.w),
          Text(
            oldPrice!,
            style: context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: oldPriceFontSize ?? 14.sp,
              color: AppColors.colorB6B6B4,
              decoration: TextDecoration.lineThrough,
            ),
            maxLines: 1,
          ),
        ],

        Text(
          " ${context.l10n.riyal}",
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: currencyFontWeight ?? FontWeight.w400,
            fontSize: priceFontSize ?? 12.sp,
            color: textColor ?? Colors.black,
            height: lineHight,
          ),
          maxLines: 1,
        ),
        if(isDiscount)...[
          SizedBox(width: 2.w),
          Text("-", style: context.textTheme.labelSmall?.copyWith(
            fontSize: priceFontSize ?? 11.sp,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),),
        ],
      ],
    );
  }
}
