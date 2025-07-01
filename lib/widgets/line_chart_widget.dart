import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ui_charts_testing/main.dart';
import 'package:ui_charts_testing/model/chart_data_model.dart';
import 'package:ui_charts_testing/model/line_theme_model.dart';
import 'package:ui_charts_testing/widgets/spline_chart_widget.dart';

class LineChartWidget extends StatelessWidget {
  final ChartThemeModel chartThemeModel;
  const LineChartWidget({super.key, required this.chartThemeModel});
  // final List<ChartData> chartData = [
  //   ChartData('Jan', 35),
  //   ChartData('Feb', 28),
  //   ChartData('Mar', 38),
  //   ChartData('Apr', 32),
  //   ChartData('May', 40),
  //   ChartData('Jun', 32),
  //   ChartData('Jul', 35),
  //   ChartData('Aug', 55),
  //   ChartData('Sep', 38),
  //   ChartData('Oct', 30),
  //   ChartData('Nov', 25),
  //   ChartData('Dec', 32),
  // ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      // Chart title
      title: ChartTitle(text: chartThemeModel.title ?? ''),

      // Legend
      legend: Legend(isVisible: chartThemeModel.enableHideData),

      // Tooltip behavior
      tooltipBehavior: TooltipBehavior(
        enable: chartThemeModel.enableViewValueDetails,
      ),

      // Primary X axis
      primaryXAxis: chartThemeModel.primaryAxisDetails ?? CategoryAxis(),

      // Primary Y axis
      primaryYAxis: chartThemeModel.secondaryAxisDetails ?? NumericAxis(),

      // Chart series
      series: <LineSeries<ChartDataModel, String>>[
        getLineSeries(chartThemeModel, getRandomValue()),
        getLineSeries(chartThemeModel, getRandomValue()),
        getLineSeries(chartThemeModel, getRandomValue()),
        getLineSeries(chartThemeModel, getRandomValue()),
        getLineSeries(chartThemeModel, getRandomValue()),
        getLineSeries(chartThemeModel, getRandomValue()),
      ],

      // Enable zooming and panning
      zoomPanBehavior: ZoomPanBehavior(
        enablePinching: true,
        enablePanning: true,
        enableDoubleTapZooming: true,
        enableMouseWheelZooming: true,
      ),
    );
  }
}

// Data model class
