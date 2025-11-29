import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';
import 'package:osama_core/src/ui/components/form_components/custom_switch.dart';

class CustomCheckboxListTile extends StatefulWidget {
  const CustomCheckboxListTile({
    super.key,
    required this.label,
    this.icon,
    this.onChanged,
    this.isLocal = false,
  });

  final String label;
  final String? icon;
  final void Function(bool value)? onChanged;
  final bool isLocal;

  @override
  State<CustomCheckboxListTile> createState() => _CustomCheckboxListTileState();
}

class _CustomCheckboxListTileState extends State<CustomCheckboxListTile> {
  // bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12).w,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFEFEFEE)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.icon != null)
            ImageView(
              widget.icon!,
              widget.isLocal ? ImageType.asset : ImageType.url,
              width: 20.w,
              height: 20.w,
            ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              widget.label,
              style: context.textTheme.labelSmall?.copyWith(
                fontSize: 12.sp,
                color: AppColors.mainText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          CustomSwitch(
            initialValue: false,
            onChanged: (value) {
              setState(() {
                // _isChecked = value;
                widget.onChanged?.call(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
