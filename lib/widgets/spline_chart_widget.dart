import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ui_charts_testing/main.dart';
import 'package:ui_charts_testing/model/chart_data_model.dart';
import 'package:ui_charts_testing/model/visualize_various_data_model.dart';

class SplineChartWidget extends StatelessWidget {
  final VisualizeVariousDataModel chartThemeModel;

  const SplineChartWidget({super.key, required this.chartThemeModel});
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: SfCartesianChart(
        title: ChartTitle(text: chartThemeModel.title ?? ''),

        legend: Legend(isVisible: chartThemeModel.enableHideData),

        tooltipBehavior: TooltipBehavior(
          enable: chartThemeModel.enableViewValueDetails,
        ),

        primaryXAxis: chartThemeModel.primaryAxisDetails ?? CategoryAxis(),

        primaryYAxis: chartThemeModel.secondaryAxisDetails ?? NumericAxis(),

        series: <SplineSeries<ChartDataModel, String>>[
          // getSplineSeries(chartThemeModel, getRandomValue()),
          getSplineSeries(chartThemeModel, getRandomValue()),
          getSplineSeries(chartThemeModel, getRandomValue()),
          getSplineSeries(chartThemeModel, getRandomValue()),
          getSplineSeries(chartThemeModel, getRandomValue()),
        ],
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true,
          enablePanning: true,
          enableDoubleTapZooming: true,
          enableMouseWheelZooming: true,
        ),
      ),
    );
  }
}

SplineSeries<ChartDataModel, String> getSplineSeries(
  VisualizeVariousDataModel chartThemeModel,
  List<ChartDataModel> chartData,
) => SplineSeries<ChartDataModel, String>(
  dataSource: chartData,
  xValueMapper: (ChartDataModel data, _) => data.month,
  yValueMapper: (ChartDataModel data, _) => data.sales,
  name: chartThemeModel.graphName,
  color: chartThemeModel.graphColor,
  width: 3,
  markerSettings: MarkerSettings(
    isVisible: true,
    height: 6,
    width: 6,
    shape: DataMarkerType.circle,
    borderWidth: 2,
    borderColor: chartThemeModel.markerColor,
  ),
  // Enable data labels
  dataLabelSettings: DataLabelSettings(
    isVisible: true,
    labelAlignment: ChartDataLabelAlignment.auto,
    textStyle: chartThemeModel.markerValueTextStyle,
    builder:
        (
          dynamic data,
          dynamic point,
          dynamic series,
          int pointIndex,
          int seriesIndex,
        ) {
          return Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Text(
              '${data.sales}k',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
          );
        },
  ),
  animationDuration: 5000,
);
LineSeries<ChartDataModel, String> getLineSeries(
  VisualizeVariousDataModel chartThemeModel,
  List<ChartDataModel> chartData,
) => LineSeries<ChartDataModel, String>(
  dataSource: chartData,
  xValueMapper: (ChartDataModel data, _) => data.month,
  yValueMapper: (ChartDataModel data, _) => data.sales,
  name: chartThemeModel.graphName,
  color: chartThemeModel.graphColor,
  width: 3,
  markerSettings: MarkerSettings(
    isVisible: true,
    height: 6,
    width: 6,
    shape: DataMarkerType.circle,
    borderWidth: 2,
    borderColor: chartThemeModel.markerColor,
  ),
  // Enable data labels
  dataLabelSettings: DataLabelSettings(
    isVisible: true,
    labelAlignment: ChartDataLabelAlignment.auto,
    textStyle: chartThemeModel.markerValueTextStyle,
    builder:
        (
          dynamic data,
          dynamic point,
          dynamic series,
          int pointIndex,
          int seriesIndex,
        ) {
          return Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Text(
              '${data.sales}k',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
          );
        },
  ),
  animationDuration: 5000,
);
ColumnSeries<ChartDataModel, String> getColumnSeries(
  VisualizeVariousDataModel chartThemeModel,
  List<ChartDataModel> chartData,
  Color graphColor,
) => ColumnSeries<ChartDataModel, String>(
  dataSource: chartData,
  xValueMapper: (ChartDataModel data, _) => data.month,
  yValueMapper: (ChartDataModel data, _) => data.sales,
  name: chartThemeModel.graphName,
  color: chartThemeModel.graphColor,
  borderRadius: BorderRadius.circular(4),
  borderWidth: 1,
  borderColor:
      chartThemeModel.graphColor?.withOpacity(0.8) ?? Colors.transparent,
  // primaryColor.withOpacity(0.8),
  spacing: 0.2,
  width: 0.7,
  dataLabelSettings: DataLabelSettings(
    isVisible: true,
    labelAlignment: ChartDataLabelAlignment.auto,
    textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    builder:
        (
          dynamic data,
          dynamic point,
          dynamic series,
          int pointIndex,
          int seriesIndex,
        ) {
          return Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Text(
              '${data.sales}k',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
          );
        },
  ),
  gradient: LinearGradient(
    colors: [
      graphColor?.withOpacity(0.6) ?? Colors.teal.withOpacity(0.6),
      graphColor ?? Colors.teal,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  ),
);
