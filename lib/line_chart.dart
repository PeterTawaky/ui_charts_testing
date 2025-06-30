import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData('Jan', 35),
    ChartData('Feb', 28),
    ChartData('Mar', 38),
    ChartData('Apr', 32),
    ChartData('May', 40),
    ChartData('Jun', 32),
    ChartData('Jul', 35),
    ChartData('Aug', 55),
    ChartData('Sep', 38),
    ChartData('Oct', 30),
    ChartData('Nov', 25),
    ChartData('Dec', 32),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      // Chart title
      title: ChartTitle(text: 'Monthly Sales Data'),

      // Legend
      legend: Legend(isVisible: true),

      // Tooltip behavior
      tooltipBehavior: TooltipBehavior(enable: true),

      // Primary X axis
      primaryXAxis: CategoryAxis(
        title: AxisTitle(text: 'Months'),
        majorGridLines: MajorGridLines(width: 0),
      ),

      // Primary Y axis
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Sales (in thousands)'),
        minimum: 0,
        maximum: 60,
        interval: 10,
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0),
      ),

      // Chart series
      series: <LineSeries<ChartData, String>>[
        LineSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.month,
          yValueMapper: (ChartData data, _) => data.sales,
          name: 'Sales',
          // Line customization
          color: Colors.blue,
          width: 3,
          // Dash pattern for line style
          dashArray: <double>[5, 0], // Solid line (use [5, 5] for dashed)
          // Markers at data points
          markerSettings: MarkerSettings(
            isVisible: true,
            height: 8,
            width: 8,
            shape: DataMarkerType.circle,
            borderWidth: 2,
            borderColor: Colors.white,
            color: Colors.blue,
          ),
          // Enable data labels
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelAlignment: ChartDataLabelAlignment.auto,
            textStyle: TextStyle(fontSize: 10, color: Colors.black87),
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
          // Animation
          animationDuration: 1000,
        ),
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
class ChartData {
  ChartData(this.month, this.sales);
  final String month;
  final double sales;
}
