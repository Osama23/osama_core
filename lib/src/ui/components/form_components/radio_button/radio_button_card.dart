import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';

class RadioButtonCard<T> extends StatefulWidget {
  final String title;
  final String? subtitle;
  final bool isSelected;
  final Widget? icon;
  final void Function(bool?) onSelect;
  final ListTileControlAffinity listTileControlAffinity;
  final bool animateTitle;
  final CrossAxisAlignment? crossAxisAlignment;
  final Widget? content;
  final CrossAxisAlignment? contentCrossAxisAlignment;
  final bool hasSelectedBackgroundColor;
  final double? titleBottomSpace;
  final double? titleFontSize;

  const RadioButtonCard({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onSelect,
    this.subtitle,
    this.icon,
    this.listTileControlAffinity = ListTileControlAffinity.trailing,
    this.animateTitle = false,
    this.crossAxisAlignment,
    this.content,
    this.contentCrossAxisAlignment,
    this.hasSelectedBackgroundColor = true,
    this.titleBottomSpace, 
    this.titleFontSize,
  });

  @override
  State createState() => RadioButtonCardState<T>();
}

class RadioButtonCardState<T> extends State<RadioButtonCard<dynamic>> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onSelect(!widget.isSelected);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.isSelected
              ? widget.hasSelectedBackgroundColor
                  ? AppColors.moreLightSecondaryColor
                  : Colors.white
              : Colors.white,
          border: Border.all(
            color: widget.isSelected
                ? AppColors.secondaryColor
                : AppColors.basicBorderColor,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment:
              widget.crossAxisAlignment ?? CrossAxisAlignment.center,
          children: [
            if (widget.icon != null) ...[
              widget.icon!,
              SizedBox(width: 9.w),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: widget.contentCrossAxisAlignment ??
                        (widget.listTileControlAffinity ==
                                ListTileControlAffinity.leading
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start),
                    children: [
                      Expanded(
                        child: widget.content ??
                            AnimatedDefaultTextStyle(
                              style: context.textTheme.labelSmall!.copyWith(
                                fontWeight: widget.animateTitle
                                    ? widget.isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w400
                                    : FontWeight.w700,
                                color: widget.animateTitle
                                    ? widget.isSelected
                                        ? AppColors.mainText
                                        : AppColors.secondText
                                    : AppColors.mainText,
                                fontSize: widget.titleFontSize ??
                                    (widget.animateTitle ? 14.sp : 16.sp),
                              ),
                              duration: const Duration(milliseconds: 300),
                              child: Text(widget.title),
                            ),
                      ),
                      if (widget.listTileControlAffinity ==
                          ListTileControlAffinity.leading)
                        SizedBox(width: 8.w),
                      Container(
                        width: 18.w,
                        height: 18.w,
                        padding: const EdgeInsets.all(3.5),
                        margin: EdgeInsets.symmetric(
                          // horizontal: 4,
                          vertical: widget.titleBottomSpace ?? (widget.content != null ? 0 : 8),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: widget.isSelected
                                  ? AppColors.secondaryColor
                                  : AppColors.placeHolderColor,
                            )),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          transitionBuilder: (child, animation) {
                            return ScaleTransition(
                                scale: animation,
                                alignment: Alignment.center,
                                child: child);
                          },
                          child: widget.isSelected
                              ? const CircleAvatar(
                                  key: ValueKey("show"),
                                  backgroundColor: AppColors.secondaryColor,
                                )
                              : const SizedBox(
                                  key: ValueKey("notShow"),
                                ),
                        ),
                      ),
                    ].checkSorting(widget.listTileControlAffinity),
                  ),
                  if (widget.subtitle != null) ...[
                    SizedBox(height: widget.titleBottomSpace ?? 6.h),
                    Text(
                      widget.subtitle!,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: Colors.black54,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ].checkSorting(widget.listTileControlAffinity),
        ),
      ),
    );
  }
}

extension RadioButtonCardUtils on List<Widget> {
  List<Widget> checkSorting(ListTileControlAffinity listTileControlAffinity) {
    switch (listTileControlAffinity) {
      case ListTileControlAffinity.leading:
        return reversed.toList();
      case ListTileControlAffinity.trailing:
        return this;
      case ListTileControlAffinity.platform:
        return this;
    }
  }
}
