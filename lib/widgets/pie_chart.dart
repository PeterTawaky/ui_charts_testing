import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartWidget extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData('Sales', 35, Colors.blue),
    ChartData('Marketing', 25, Colors.green),
    ChartData('Development', 20, Colors.orange),
    ChartData('Support', 15, Colors.red),
    ChartData('Others', 5, Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      // Chart title
      title: ChartTitle(text: 'Department Budget Distribution'),

      // Legend
      legend: Legend(
        isVisible: true,
        position: LegendPosition.right,
        overflowMode: LegendItemOverflowMode.wrap,
        textStyle: TextStyle(fontSize: 12),
      ),

      // Tooltip behavior
      tooltipBehavior: TooltipBehavior(
        enable: true,
        format: 'point.x : point.y%',
      ),

      // Chart series
      series: <CircularSeries<ChartData, String>>[
        PieSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.category,
          yValueMapper: (ChartData data, _) => data.value,
          pointColorMapper: (ChartData data, _) => data.color,
          name: 'Budget',

          // Pie customization
          radius: '70%',
          explode: true,
          explodeAll: false,
          explodeIndex: 0,
          explodeOffset: '10%',

          // Data labels
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
            useSeriesColor: true,
            textStyle: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            connectorLineSettings: ConnectorLineSettings(
              type: ConnectorType.curve,
              length: '20%',
              width: 2,
            ),
            labelIntersectAction: LabelIntersectAction.shift,
            builder:
                (
                  dynamic data,
                  dynamic point,
                  dynamic series,
                  int pointIndex,
                  int seriesIndex,
                ) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: data.color.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: Text(
                      '${data.value}%',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
          ),

          // Selection behavior
          selectionBehavior: SelectionBehavior(
           enable: true,
            selectedBorderColor: Colors.white,
            selectedBorderWidth: 5,
            unselectedOpacity: 0.4,
            selectedOpacity: 1.0,
            toggleSelection: true,
          ),

          // Stroke styling
          strokeColor: Colors.white,
          strokeWidth: 2,

          // Animation
          animationDuration: 1200,

          // Point rendering callback for additional customization
          pointRenderMode: PointRenderMode.segment,

          // Enable smart labels
        ),
      ],
    );
  }
}

// Data model class
class ChartData {
  ChartData(this.category, this.value, this.color);
  final String category;
  final double value;
  final Color color;
}
