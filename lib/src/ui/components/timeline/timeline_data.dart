import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:osama_core/osama_core.dart';

class TimelineData extends Equatable {
  final Widget content;
  final StepStatus status;
  final bool hasGap;
  final bool hasPadding;
  final double? indicatorSize;
  final double? gap;
  final bool hasCount;
  final bool hasContent;
  final bool hasLinePadding;
  final int? sharedCount;
  final int? sharedPaidCount;
  final bool? showProgress;

  const TimelineData({
    required this.content,
    this.indicatorSize,
    this.gap,
    this.status = StepStatus.ideal,
    this.hasGap = true,
    this.hasPadding = true,
    this.hasCount = true,
    this.hasContent = true,
    this.hasLinePadding = false,
    this.sharedCount,
    this.sharedPaidCount,
    this.showProgress,
  });

  @override
  List<Object?> get props => [
        content,
        status,
        hasGap,
        hasPadding,
        indicatorSize,
        gap,
        hasCount,
        hasContent,
        hasLinePadding,
        sharedCount,
        sharedPaidCount,
        showProgress,
      ];
}
