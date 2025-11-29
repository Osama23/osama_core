import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osama_core/l10n/l10n.dart';
import 'package:osama_core/src/ui/theme/app_fonts.dart';

class EmptySearchResult extends StatelessWidget {
  const EmptySearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            'assets/svg/empty_search.svg',
            height: 130.h,
          ),
          SizedBox(height: 16.h),
          Text(
            context.l10n.emptySearchResult,
            style: AppFonts.headingBold18px.mainTextColor,
          ),
        ],
      ),
    );
  }
}