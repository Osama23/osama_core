import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:osama_core/osama_core.dart';

class ApiErrorWidget extends StatelessWidget {
  final String txt;
  const ApiErrorWidget({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w,),
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: AppColors.colorFDEEEE,
        border: Border.all(
          color: AppColors.colorE92727,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            txt,
            style: FontFamilyStyle.standardTextStyleW500(fontSize: 12.sp,color: AppColors.color1C1B13,),
          ),
          SizedBox(width: 10.w,),
          Container(
            width: 32.w,
            height: 32.w,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.w)),
              color: AppColors.colorEF3B53,
            ),
            child:  Icon(Icons.cancel, size: 20.w, color: AppColors.colorFFFFFF,),
          ),
        ],
      ),
    );
  }
}
