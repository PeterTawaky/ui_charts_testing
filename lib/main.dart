import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_charts_testing/model/visualize_various_data_model.dart';
import 'package:ui_charts_testing/widgets/column_chart_widget.dart';
import 'package:ui_charts_testing/widgets/doughnut_chart_widget.dart';
import 'package:ui_charts_testing/widgets/line_chart_widget.dart';
import 'package:ui_charts_testing/model/chart_data_model.dart';
import 'package:ui_charts_testing/widgets/pie_chart.dart';
import 'package:ui_charts_testing/widgets/radial_bar_chart.dart';
import 'package:ui_charts_testing/widgets/spline_chart_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion Charts Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2,
            crossAxisCount: 2,
          ),
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: ColumnChartWidget(
                chartThemeModel: VisualizeVariousDataModel(),
              ),
            ),
            LineChartWidget(chartThemeModel: VisualizeVariousDataModel()),
            SplineChartWidget(chartThemeModel: VisualizeVariousDataModel()),
            DoughnutChartWidget(),
            PieChartWidget(),
            RadialBarChartWidget(),
          ],
        ),
      ),
    );
  }
}

List<ChartDataModel> getRandomValue() {
  List<ChartDataModel> chartData = [];
  const List<double> values = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
  for (var i = 0; i < 12; i++) {
    final random = Random();
    double randomValue = values[random.nextInt(values.length)];
    chartData.add(ChartDataModel('Month ${i + 1}', randomValue));
  }
  return chartData;
}
