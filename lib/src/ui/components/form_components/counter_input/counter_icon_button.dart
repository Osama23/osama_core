import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';

class CounterIconButton extends StatelessWidget {
  const CounterIconButton({
    super.key,
    required this.isAdd,
    required this.onPressed,
  });

  final bool isAdd;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 24.w,
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: AppColors.moreLightSecondaryColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          isAdd ? Icons.add : Icons.remove,
          size: 18.w,
          color: AppColors.secondaryColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
