import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class BottomButtonCard extends StatelessWidget {
  const BottomButtonCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: const Key("BottomButtonCard"),
      color: Colors.white,
      margin: EdgeInsets.zero,
      elevation: 10,
      child: Padding(
        key: const Key("BottomButtonCardPadding"),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24)
            .copyWith(bottom: 8.h),
        child: SafeArea(
          key: const Key("BottomButtonCard"),
          top: false,
          child: child,
        ),
      ),
    );
  }
}
