import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterRangeSlider extends StatelessWidget {
  const FilterRangeSlider({
    super.key,
    required this.minPriceRangeValue,
    required this.maxPriceRangeValue,
    required this.intervals,
    this.onChanged,
    this.initialValues,
    this.dataSource,
  });

  final num minPriceRangeValue;
  final num maxPriceRangeValue;
  final double intervals;
  final void Function(SfRangeValues)? onChanged;
  final SfRangeValues? initialValues;
  final List<Data>? dataSource;

  @override
  Widget build(BuildContext context) {
    return SfRangeSelectorTheme(
      data: const SfRangeSelectorThemeData(
        activeTrackColor: AppColors.secondaryColor,
        inactiveTrackColor: AppColors.basicBorderColor,
      ),
      child: SfRangeSelector(
        min: minPriceRangeValue,
        max: maxPriceRangeValue,
        stepSize: intervals,

        endThumbIcon: Container(
          height: 15.h,
          width: 15.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.colorFFFFFF,
            border: Border.all(color: AppColors.color6263AB, width: 3),
          ),
        ),
        startThumbIcon: Container(
          height: 15.h,
          width: 15.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.colorFFFFFF,
            border: Border.all(color: AppColors.color6263AB, width: 3),
          ),
        ),
        interval: intervals,
        showTicks: false,
        showLabels: false,
        enableTooltip: false,
        activeColor: AppColors.color6263AB,
        onChanged: onChanged,
        initialValues: initialValues,
        child: SizedBox(
          height: 50.h,
          child: SfCartesianChart(
            margin: const EdgeInsets.all(0),
            primaryXAxis: NumericAxis(
              isVisible: false,
              minimum: minPriceRangeValue.toDouble(),
              maximum: maxPriceRangeValue.toDouble(),
              isInversed: true,
            ),
            primaryYAxis: const NumericAxis(isVisible: false, maximum: 12),
            plotAreaBorderWidth: 0,
            plotAreaBackgroundColor: Colors.transparent,
            series: <ColumnSeries<Data, double>>[
              ColumnSeries<Data, double>(
                dataSource: dataSource,
                color: AppColors.lightSecondaryColor,
                spacing: 0.01,
                xValueMapper: (Data sales, int index) => sales.x,
                yValueMapper: (Data sales, int index) => sales.y,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Data {
  Data({
    required this.x,
    required this.y,
  });

  final double x;
  final double y;
}
