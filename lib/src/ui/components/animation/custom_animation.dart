
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomAnimation extends StatelessWidget {
  final Widget? child;
  final int? index;
  final bool vertical;
  final bool scale;
  final Duration? duration;
  final int? columnCount;

  const CustomAnimation({super.key,
    this.child,
    this.index,
    this.vertical = true,
    this.scale = false,
    this.duration,
    this.columnCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    if (columnCount! > 0) {
      return AnimationConfiguration.staggeredGrid(
        columnCount: columnCount!,
        position: index!,
        duration: duration ?? const Duration(milliseconds: 100),
        child: Visibility(
          visible: scale,
          replacement: Visibility(
            visible: vertical,
            replacement: SlideAnimation(
              horizontalOffset: 100,
              child: FadeInAnimation(
                child: child!,
              ),
            ),
            child: SlideAnimation(
              verticalOffset: 100,
              child: FadeInAnimation(
                child: child!,
              ),
            ),
          ),
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: child!,
            ),
          ),
        ),
      );
    } else {
      return AnimationConfiguration.staggeredList(
        position: index!,
        duration: duration ?? const Duration(milliseconds: 300),
        child: Visibility(
          visible: scale,
          replacement: Visibility(
            visible: vertical,
            replacement: SlideAnimation(
              horizontalOffset: 100,
              child: FadeInAnimation(
                child: child!,
              ),
            ),
            child: SlideAnimation(
              verticalOffset: 100,
              child: FadeInAnimation(
                child: child!,
              ),
            ),
          ),
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: child!,
            ),
          ),
        ),
      );
    }
  }
}
