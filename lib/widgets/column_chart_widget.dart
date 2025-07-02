import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ui_charts_testing/main.dart';
import 'package:ui_charts_testing/model/chart_data_model.dart';
import 'package:ui_charts_testing/model/visualize_various_data_model.dart';
import 'package:ui_charts_testing/widgets/spline_chart_widget.dart';

class ColumnChartWidget extends StatelessWidget {
  final VisualizeVariousDataModel chartThemeModel;

  // final List<ChartDataModel> data;
  // final String xAxisTitle;
  // final String yAxisTitle;
  // final double maxY;
  // final Color primaryColor;

  const ColumnChartWidget({
    super.key,
    required this.chartThemeModel,
    // required this.data,
    // this.xAxisTitle = 'Months',
    // this.yAxisTitle = 'Sales (in thousands)',
    // this.maxY = 60,
    // this.primaryColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: chartThemeModel.title ?? ''),
      legend: Legend(isVisible: chartThemeModel.enableHideData),
      tooltipBehavior: TooltipBehavior(
        enable: chartThemeModel.enableViewValueDetails,
      ),
      primaryXAxis: chartThemeModel.primaryAxisDetails ?? CategoryAxis(),
      primaryYAxis: chartThemeModel.secondaryAxisDetails ?? NumericAxis(),
      series: <ColumnSeries<ChartDataModel, String>>[
        getColumnSeries(chartThemeModel, getRandomValue(), Colors.teal),
        getColumnSeries(chartThemeModel, getRandomValue(), Colors.red),
        getColumnSeries(chartThemeModel, getRandomValue(), Colors.purpleAccent),
      ],
    );
  }
}
