import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ui_charts_testing/model/chart_data_model.dart';

class RadialBarChartWidget extends StatelessWidget {
  final List<RadialDataModel> chartData = [
    RadialDataModel('CPU', 75, Colors.blue),
    RadialDataModel('Memory', 60, Colors.green),
    RadialDataModel('Storage', 85, Colors.orange),
    RadialDataModel('Network', 45, Colors.red),
    RadialDataModel('Battery', 90, Colors.purple),
    RadialDataModel('time', 90, Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      // Chart title
      title: ChartTitle(text: 'System Performance Metrics'),

      // Legend
      legend: Legend(
        isVisible: true,
        position: LegendPosition.bottom,
        overflowMode: LegendItemOverflowMode.wrap,
        textStyle: TextStyle(fontSize: 11, color: Colors.white),
      ),

      // Tooltip behavior
      tooltipBehavior: TooltipBehavior(
        enable: true,
        format: 'point.x : point.y%',
      ),

      // Chart series
      series: <CircularSeries<RadialDataModel, String>>[
        RadialBarSeries<RadialDataModel, String>(
          dataSource: chartData,
          xValueMapper: (RadialDataModel data, _) => data.category,
          yValueMapper: (RadialDataModel data, _) => data.value,
          pointColorMapper: (RadialDataModel data, _) => data.color,
          name: 'Performance',

          // Radial bar customization
          maximumValue: 100,
          radius: '100%',
          innerRadius: '30%',
          gap: '10%',
          cornerStyle: CornerStyle.bothCurve,

          // Track styling
          trackColor: Colors.grey,
          trackBorderColor: Colors.grey,
          trackBorderWidth: 1,
          trackOpacity: 0.3,

          // Data labels
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.inside,
            useSeriesColor: false,
            textStyle: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
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
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: data.color, width: 1),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${data.category}',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: data.color,
                          ),
                        ),
                        Text(
                          '${data.value}%',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  );
                },
          ),

          // Selection behavior
          selectionBehavior: SelectionBehavior(
            enable: true,
            selectedBorderColor: Colors.white,
            selectedBorderWidth: 1,
            unselectedOpacity: 0.4,
            selectedOpacity: 1.0,
            toggleSelection: true,
          ),

          // Animation
          animationDuration: 2000,
          animationDelay: 100,

          // Enable tooltips
          enableTooltip: true,
        ),
      ],

      // Center annotation for overall status
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.computer, size: 30, color: Colors.blue),
                SizedBox(height: 4),
                Text(
                  'System',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  'Health',
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
