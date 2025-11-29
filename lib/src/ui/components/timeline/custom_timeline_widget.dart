// import 'package:base_project/features/order/order_details/presentation/widgets/order_stepper/order_step.dart';
// import 'package:base_project/features/payment/core/presentation/widgets/payment_stepper/payment_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';
import 'package:timelines_plus/timelines_plus.dart';

class CustomTimelineWidget extends StatelessWidget {
  const CustomTimelineWidget({
    super.key,
    this.index,
    this.gap,
    required this.content,
    this.isLast = false,
    this.status = StepStatus.ideal,
    this.hasGap = true,
    this.hasPadding = true,
    this.indicatorSize,
    this.topSpace,
    required this.hasCount,
    required this.hasContent,
    required this.hasIndicator,
    this.hasLinePadding = false,
    this.sharedCount,
    this.sharedPaidCount,
    this.showProgress,
  });

  final int? index;
  final bool isLast;
  // final bool isFirst;
  final Widget content;
  final StepStatus status;
  final bool hasGap;
  final bool hasPadding;
  final double? indicatorSize;
  final double? topSpace;
  final double? gap;
  final bool hasCount;
  final bool hasContent;
  final bool hasIndicator;

  /// Boolean to check if the indicator is needed or not
  final bool hasLinePadding;

  final int? sharedCount;
  final int? sharedPaidCount;
  final bool? showProgress;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasIndicator) ...[
            Padding(
              padding: EdgeInsets.only(top: topSpace ?? 0),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  if (!isLast)
                    Container(
                      padding:
                          hasLinePadding
                              ? const EdgeInsets.symmetric(vertical: 4)
                              : EdgeInsets.zero,
                      child: DashedLineConnector(
                        color:
                            status ==
                                    StepStatus
                                        .ideal /*|| status == StepStatus.selected*/
                                ? AppColors.placeHolderColor
                                : AppColors.accentColor,
                        dash: 5,
                        thickness: 1.3,
                        gap:
                            (status == StepStatus.completed || !hasGap ? 0 : 4),
                      ),
                    ),
                  OrderStepWidget(
                    index: index,
                    status: status,
                    size: indicatorSize ?? 25.w,
                    textColor: AppColors.mainText,
                    margin: EdgeInsets.only(
                      bottom: status == StepStatus.completed ? 2 : 0,
                    ),
                    hasCount: hasCount,
                    hasContent: hasContent,
                    sharedCount: sharedCount,
                    sharedPaidCount: sharedPaidCount,
                    showProgress: showProgress,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
          ],
          Expanded(
            child: Padding(
              padding:
                  !hasPadding
                      ? EdgeInsets.zero
                      : EdgeInsets.only(bottom: isLast ? 12 : 24),
              child: content,
            ),
            // child: Container(
            //   margin: const EdgeInsets.only(bottom: 24),
            //   child: PaymentPlanListTile(
            //     title: paymentPlanList.deposit.toPlanTitle(),
            //     description: paymentPlanList.deposit.toDescription(),
            //     amount: paymentPlanList.deposit.amount,
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
