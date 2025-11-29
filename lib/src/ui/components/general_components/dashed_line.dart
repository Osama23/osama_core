// common widget for vertical dashed lines
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:osama_core/osama_core.dart';

class DashedLine extends StatelessWidget {
  final double totalHeight;
  final Color? color;

  const DashedLine({super.key, required this.totalHeight, this.color = AppColors.color909090});

  @override
  Widget build(BuildContext context) {
          final dashCount = (totalHeight / (2 * 4.h)).ceil();
          return Flex(
            direction: Axis.vertical,
            children: List.generate(dashCount, (index) {
              return Column(
                children: [
                  SizedBox(
                    width: 1.w,
                    height: 4.h,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: color),
                    ),
                  ),
                  if(index != dashCount - 1)
                  SizedBox(height: 4.h,),
                ],
              );
            }),
          );
  }
}