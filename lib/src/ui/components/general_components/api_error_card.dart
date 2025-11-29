import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osama_core/osama_core.dart';

class ApiErrorCard extends StatelessWidget {
  const ApiErrorCard({
    super.key,
    this.message,
    this.onRetry,
  });

  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            'assets/svg/warning_orange.svg',
            width: 128.w,
          ),
          SizedBox(height: 24.h),
          Text(
            context.l10n.loadError,
            style: AppFonts.headingBold18px.mainTextColor,
          ),
          SizedBox(height: 8.h),
          Text(
            message ?? context.l10n.loadErrorPleaseTryAgain,
            style: AppFonts.bodyRegular14px.secondTextColor,
          ),
          if (onRetry != null) ...[
            SizedBox(height: 24.h),
            MainButton(
              buttonStyle: MainButtonStyle.outline,
              onTap: onRetry,
              text: context.l10n.retry,
            ),
          ],
        ],
      ),
    );
  }
}
