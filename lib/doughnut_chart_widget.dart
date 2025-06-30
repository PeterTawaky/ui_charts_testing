import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChartWidget extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData('Mobile', 35, Colors.blue),
    ChartData('Desktop', 25, Colors.green),
    ChartData('Tablet', 20, Colors.orange),
    ChartData('Web', 15, Colors.red),
    ChartData('Others', 5, Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      // Chart title
      title: ChartTitle(text: 'Device Usage Statistics'),
      
      // Legend
      legend: Legend(
        isVisible: true,
        position: LegendPosition.bottom,
        overflowMode: LegendItemOverflowMode.wrap,
      ),
      
      // Tooltip behavior
      tooltipBehavior: TooltipBehavior(enable: true),
      
      // Chart series
      series: <CircularSeries<ChartData, String>>[
        DoughnutSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.category,
          yValueMapper: (ChartData data, _) => data.value,
          pointColorMapper: (ChartData data, _) => data.color,
          name: 'Usage',
          
          // Doughnut customization
          innerRadius: '60%',
          radius: '80%',
          explode: true,
          explodeIndex: 0,
          explodeOffset: '10%',
          
          // Data labels
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
            useSeriesColor: true,
            textStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            connectorLineSettings: ConnectorLineSettings(
              type: ConnectorType.curve,
              length: '25%',
            ),
            builder: (dynamic data, dynamic point, dynamic series, 
                     int pointIndex, int seriesIndex) {
              return Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${data.category}',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: data.color,
                      ),
                    ),
                    Text(
                      '${data.value}%',
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.grey[600],
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
            selectedColor: Colors.grey[300],
            unselectedColor: Colors.grey[400],
          ),
          
          // Animation
          animationDuration: 1500,
        ),
      ],
      
      // Center text (optional)
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  '100%',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
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