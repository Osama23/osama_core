import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/src/resources/values/values.dart';

class CustomSwitch extends StatefulWidget {
  final bool? initialValue;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  CustomSwitchState createState() => CustomSwitchState();
}

class CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> animation;
  late AlignmentDirectional _alignmentDirectional;

  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue ?? false;
    _alignmentDirectional =
        _value
            ? AlignmentDirectional.centerEnd
            : AlignmentDirectional.centerStart;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    animation = AlignmentTween(
      begin: _value ? Alignment.centerRight : Alignment.centerLeft,
      end: _value ? Alignment.centerLeft : Alignment.centerRight,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      _value = widget.initialValue ?? false;
      if (_value) {
        _alignmentDirectional = AlignmentDirectional.centerEnd;
        _controller.forward();
      } else {
        _alignmentDirectional = AlignmentDirectional.centerStart;
        _controller.reverse();
      }
      // animation = Ali(
      //   begin: _value ? AlignmentDirectional.centerStart : AlignmentDirectional.centerEnd,
      //   end: _value ? Alignment.centerLeft : Alignment.centerRight,
      // ).animate(_controller);
    }
  }

  void _toggle() {
    setState(() {
      _value = !_value;
      widget.onChanged(_value);
      if (_value) {
        _alignmentDirectional = AlignmentDirectional.centerEnd;
        _controller.forward();
      } else {
        _alignmentDirectional = AlignmentDirectional.centerStart;
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: Container(
        width: 42.w,
        height: 26.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:
              _value
                  ? AppColors.accentColor.withValues(alpha: 0.24)
                  : Colors.grey[300],
        ),
        child: AnimatedAlign(
          alignment: _alignmentDirectional,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          child: Container(
            width: 23.w,
            height: 23.w,
            margin: const EdgeInsets.all(1.5),
            // padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _value ? AppColors.accentColor : Colors.white,
            ),
            child: Icon(
              _value ? Icons.check_rounded : Icons.close_rounded,
              color: _value ? Colors.white : AppColors.textGrey,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
