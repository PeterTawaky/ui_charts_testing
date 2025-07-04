import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VisualizeVariousDataModel {
  final String? horizontalAxisTitle;
  final String? graphName;
  final TextStyle? markerValueTextStyle;
  final CategoryAxis? primaryAxisDetails;
  final String? verticalAxisTitle;
  final String? title;
  // final List<ChartDataModel> chartData;
  final bool enableHideData;
  final bool enableViewValueDetails;
  final NumericAxis? secondaryAxisDetails;
  final Color markerColor;
  final Color? graphColor;
  const VisualizeVariousDataModel({
    // required this.chartData,
    this.graphColor,
    this.markerColor = Colors.black,
    this.markerValueTextStyle,
    this.secondaryAxisDetails,
    this.primaryAxisDetails,
    this.graphName,

    this.title,
    this.horizontalAxisTitle,
    this.verticalAxisTitle,
    this.enableHideData = true,
    this.enableViewValueDetails = true,
  });
}
