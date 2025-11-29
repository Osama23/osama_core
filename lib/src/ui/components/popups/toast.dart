// Common widget to show success or failure toast messages.
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:osama_core/osama_core.dart';


class Toast {
  Toast._();

  static void initializeToast(BuildContext context) {
    FToast().init(context);
  }

  static void showToast(
      BuildContext context, String title,{ToastType toastType = ToastType.success,
        int toastLength = ToastLength.medium,ToastGravity grevity = ToastGravity.CENTER}) {
    var toast = FToast();
    var widget = ToastWidget(title: title,type: toastType,);
    toast.init(context);
    toast.showToast(
        child: widget,
        toastDuration: Duration(seconds: toastLength),
        gravity: grevity
    );
  }
}

enum ToastType{
  error,
  warning,
  success
}

class ToastLength{
 static const int short=2;
 static const int long=5;
 static const int medium = 3;
}


class ToastWidget extends StatelessWidget {
  const ToastWidget({required this.title,required this.type,this.icon,super.key});
  final Widget? icon;
  final String title;
  final ToastType type;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        constraints: BoxConstraints(minHeight:44.h),
        decoration: BoxDecoration(
          color: /*type == ToastType.error?AppColors.colorEB5757:*/AppColors.color000000,
            borderRadius: BorderRadius.circular(14.w),),
      margin: AppDimensions.symmetricH24,
      padding: AppDimensions.symmetricH16V10,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: icon==null?MainAxisAlignment.center:MainAxisAlignment.start,
        children: [
          if(icon!=null)...[
          icon??const SizedBox.shrink(),
            const SizedBox(width: 12,)
          ],
          Flexible(
              fit: FlexFit.tight,
              child: Text(title,style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15.sp,color: theme.primaryColorLight),textAlign: icon==null?TextAlign.center:TextAlign.start,))
        ],
      ),
    );
  }
}
