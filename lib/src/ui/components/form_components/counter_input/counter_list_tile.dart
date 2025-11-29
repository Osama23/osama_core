import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';
import 'package:osama_core/src/ui/components/form_components/counter_input/counter_icon_button.dart';

class CounterListTile extends StatefulWidget {
  const CounterListTile({
    super.key,
    this.icon,
    required this.label,
    this.onCounterChange,
    this.min,
    this.max,
  });

  final String? icon;
  final String label;
  final void Function(int value)? onCounterChange;
  final int? min;
  final int? max;

  @override
  State<CounterListTile> createState() => _CounterListTileState();
}

class _CounterListTileState extends State<CounterListTile> {
  late int _counter;

  @override
  void initState() {
    _counter = widget.min ?? 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14).w,
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
              ImageType.url,
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
          SizedBox(width: 12.w),
          CounterIconButton(
            isAdd: false,
            onPressed: () {
              if (_counter > (widget.min ?? 1)) {
                _counter -= 1;
                widget.onCounterChange?.call(_counter);
                setState(() {});
              }
            },
          ),
          Container(
            width: 24.w,
            height: 24.w,
            padding: const EdgeInsets.all(4),
            child: Center(
              child: Text(
                '$_counter',
                style: context.textTheme.labelSmall?.copyWith(
                  color: AppColors.mainText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          CounterIconButton(
            isAdd: true,
            onPressed: () {
              if (_counter < (widget.max ?? 100)) {
                _counter += 1;
                widget.onCounterChange?.call(_counter);
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
