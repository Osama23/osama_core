import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      horizontalTitleGap: 0,
      child: CheckboxListTile(
        value: value,
        contentPadding: EdgeInsets.zero,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.leading,
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: WidgetStateBorderSide.resolveWith(
          (states) =>
              const BorderSide(color: AppColors.placeHolderColor, width: 1.3),
        ),
        title: Text(
          context.l10n.dontShowAgain,
          style: FontFamilyStyle.standardTextStyleW500(
            fontSize: 14.sp,
            color: AppColors.mainText,
          ),
        ),
      ),
    );
  }
}
