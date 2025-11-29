import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class SegmentedTabBar extends StatelessWidget {
  const SegmentedTabBar({
    super.key,
    required this.tabs,
    this.onTap,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.isScrollable = false,
    this.labelPadding,
    this.initialIndex = 0,
    this.controller,
  });

  final List<Widget> tabs;
  final void Function(int)? onTap;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final bool isScrollable;
  final EdgeInsets? labelPadding;
  final int initialIndex;
  final TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      padding: const EdgeInsets.all(4).w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(72),
        color: AppColors.rowBG,
      ),
      child: controller != null
          ? _tabBar
          : DefaultTabController(
              initialIndex: initialIndex,
              length: tabs.length,
              child: _tabBar,
            ),
    );
  }

  Widget get _tabBar => TabBar(
        isScrollable: isScrollable,
        controller: controller,
        tabAlignment: isScrollable ? TabAlignment.start : null,
        onTap: onTap,
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: labelPadding ??
            EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
        tabs: tabs,
        dividerHeight: 0,
        indicator: RectangularIndicator(
          color: Colors.white,
          topLeftRadius: 48,
          topRightRadius: 48,
          bottomLeftRadius: 48,
          bottomRightRadius: 48,
        ),
        labelStyle: labelStyle,
        unselectedLabelStyle: unselectedLabelStyle,
      );
}
