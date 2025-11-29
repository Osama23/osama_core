import 'package:flutter/cupertino.dart';
import 'package:osama_core/osama_core.dart';

class TimelineList extends StatelessWidget {
  const TimelineList({
    super.key,
    required this.timelines,
    this.hasCount = true,
    this.topSpace,
    this.hasIndicator = true,
  });

  final List<TimelineData> timelines;
  final bool hasCount;
  final double? topSpace;
  final bool hasIndicator;

  /// Boolean to check if the indicator is needed or not

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(timelines.length, (index) {
        final timeline = timelines[index];
        return CustomTimelineWidget(
          index: hasCount ? index + 1 : null,
          isLast: index == (timelines.length - 1),
          content: timeline.content,
          status: timeline.status,
          hasPadding: timeline.hasPadding,
          hasGap: timeline.hasGap,
          gap: timeline.gap,
          indicatorSize: timeline.indicatorSize,
          topSpace: index == 0 ? topSpace : null,
          hasCount: timeline.hasCount,
          hasContent: timeline.hasContent,
          hasIndicator: hasIndicator,
          hasLinePadding: timeline.hasLinePadding,
          sharedCount: timeline.sharedCount,
          sharedPaidCount: timeline.sharedPaidCount,
          showProgress: timeline.showProgress,
        );
      }),
    );
  }
}
