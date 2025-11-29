
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';

class OrderStepWidget extends StatelessWidget {
  const OrderStepWidget({
    super.key,
    this.index,
    required this.status,
    this.size,
    this.textColor,
    this.margin,
    this.hasCount = true,
    this.hasContent = true,
    this.sharedCount,
    this.sharedPaidCount,
    this.showProgress,
  });

  final int? index;
  final StepStatus status;
  final double? size;
  final Color? textColor;
  final EdgeInsets? margin;
  final bool hasCount;
  final bool hasContent;
  final int? sharedCount;
  final int? sharedPaidCount;
  final bool? showProgress;

  @override
  Widget build(BuildContext context) {
    return (showProgress == true && sharedCount != 0)
        ? Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: size ?? 20.w,
              height: size ?? 20.w,
              padding:
                  status == StepStatus.completed
                      ? EdgeInsets.all(3.w)
                      : null,
              margin: margin,
              decoration: BoxDecoration(
                color:
                    status == StepStatus.completed
                        ? AppColors.accentColor
                        : status == StepStatus.canceled
                        ? AppColors.errorColor
                        : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.transparent,
                  width: status == StepStatus.completed ? 0 : 5,
                ),
              ),
              child:
                  !hasContent
                      ? null
                      : (index == null || !hasCount) &&
                          status != StepStatus.completed &&
                          status != StepStatus.canceled
                      ? status == StepStatus.selected
                          ? const CircleAvatar(
                            // radius: 20.w,
                            backgroundColor: AppColors.accentColor,
                          )
                          : null
                      : FittedBox(child: Center(child: _stepWidget(context))),
            ),
            SizedBox(
              width: (size ?? 25.w) - 5,
              height: (size ?? 25.w) - 5,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: AppColors.accentColor,
                  backgroundColor: AppColors.placeHolderColor.withValues(
                    alpha: 0.4,
                  ),
                  value:
                      (sharedPaidCount?.toDouble() ?? 0) /
                      (sharedCount?.toDouble() ?? 0),
                ),
              ),
            ),
          ],
        )
        : Container(
          width: size ?? 20.w, // size ?? 35.w,
          height: size ?? 20.w, // size ?? 35.w,
          padding: EdgeInsets.all(3.w),
          margin: margin,
          decoration: BoxDecoration(
            color:
                status == StepStatus.completed
                    ? AppColors.accentColor
                    : status == StepStatus.canceled
                    ? AppColors.errorColor
                    : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: _borderColor(),
              width: status == StepStatus.completed ? 0 : 1.5,
            ),
          ),
          child:
              !hasContent
                  ? null
                  : (index == null || !hasCount) &&
                      status != StepStatus.completed &&
                      status != StepStatus.canceled
                  ? status == StepStatus.selected
                      ? const CircleAvatar(
                        // radius: 20.w,
                        backgroundColor: AppColors.accentColor,
                      )
                      : null
                  : FittedBox(child: Center(child: _stepWidget(context))),
        );
  }

  Color _borderColor() {
    switch (status) {
      case StepStatus.ideal:
        return AppColors.placeHolderColor;
      case StepStatus.selected:
        return AppColors.accentColor;
      case StepStatus.canceled:
        return AppColors.errorColor;
      case StepStatus.completed:
        return Colors.white;
      case StepStatus.loading:
        return Colors.black;
    }
  }

  Color _stepTextColor() {
    switch (status) {
      case StepStatus.ideal:
        return textColor ?? AppColors.secondText;
      case StepStatus.selected:
        return AppColors.accentColor;
      case StepStatus.canceled:
      case StepStatus.completed:
        return Colors.black;
      case StepStatus.loading:
        return Colors.black;
    }
  }

  Widget _stepWidget(BuildContext context) {
    switch (status) {
      case StepStatus.ideal:
        return Text(
          index.toString(),
          style: context.textTheme.labelSmall?.copyWith(
            fontWeight:
                status == StepStatus.selected
                    ? FontWeight.w700
                    : FontWeight.w500,
            color: AppColors.mainText,
          ),
        );
      case StepStatus.selected:
        return Text(
          index.toString(),
          style: context.textTheme.labelSmall?.copyWith(
            fontWeight:
                status == StepStatus.selected
                    ? FontWeight.w700
                    : FontWeight.w500,
            color: _stepTextColor(),
          ),
        );
      case StepStatus.completed:
        return const Icon(Icons.check, color: Colors.white);
      case StepStatus.canceled:
        return const Icon(Icons.close, color: Colors.white);
      case StepStatus.loading:
        return Text(
          index.toString(),
          style: context.textTheme.labelSmall?.copyWith(
            fontWeight:
                status == StepStatus.selected
                    ? FontWeight.w700
                    : FontWeight.w500,
            color: _stepTextColor(),
          ),
        );
    }
  }
}
