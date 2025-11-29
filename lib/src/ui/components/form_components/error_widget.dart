import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osama_core/osama_core.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget(
      this.visible,
      this.text,
      {this.img = CoreAppSvg.warningCircle,
      super.key,});
  final bool visible;
  final String text;
  final String img;

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    return Visibility(
      visible: visible,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            img,
            height: 18.h,
            width: 18.w,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: FontFamilyStyle.standardTextStyleW400(fontSize: 12.sp,color: AppColors.colorEF3B53),
          ),
        ],
      ),
    );
  }
}
