import 'package:osama_core/osama_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({required this.endTime,required this.resendOTP, super.key});
  final VoidCallback  resendOTP ;
  final int endTime;

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: endTime,
      widgetBuilder: (_, CurrentRemainingTime? time) {
        if (time == null) {
          return RichText(
              text: TextSpan(children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = resendOTP,
                    text: context.l10n.resendCode,
                    style: FontFamilyStyle.standardTextStyleW700(color: AppColors.color6263AB, lineHeight: 1.4, fontSize: 14.sp)
                ),
                // WidgetSpan(
                //     child: SizedBox(
                //       width: 5.w,
                //     )),
              ]));
        }
        return RichText(text: TextSpan(
            children: [
              TextSpan(
                text: '${context.l10n.resendTheCodeAfter} ',
                style: FontFamilyStyle.standardTextStyleW400(color: AppColors.colorB6B6B4.withOpacity(0.8), lineHeight: 1.4, fontSize: 14.sp),
              ),
              TextSpan(
                text: '(${time.getRemainingTime()})',
                style: FontFamilyStyle.standardTextStyleW400(color: AppColors.color6263AB, lineHeight: 1.4, fontSize: 14.sp),
              )
            ]
        ));
      },
    );
  }
}