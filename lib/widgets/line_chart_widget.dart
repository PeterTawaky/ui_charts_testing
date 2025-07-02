import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ui_charts_testing/main.dart';
import 'package:ui_charts_testing/model/chart_data_model.dart';
import 'package:ui_charts_testing/model/visualize_various_data_model.dart';
import 'package:ui_charts_testing/widgets/spline_chart_widget.dart';

class LineChartWidget extends StatelessWidget {
  final VisualizeVariousDataModel chartThemeModel;
  const LineChartWidget({super.key, required this.chartThemeModel});

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
