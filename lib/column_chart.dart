import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column Chart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColumnChartPage(),
    );
  }
}

class ColumnChartPage extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Column Chart Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SfCartesianChart(
          // Chart title
          title: ChartTitle(text: 'Monthly Sales Data'),
          
          // Legend
          legend: Legend(isVisible: true),
          
          // Tooltip behavior
          tooltipBehavior: TooltipBehavior(enable: true),
          
          // Primary X axis
          primaryXAxis: CategoryAxis(
            title: AxisTitle(text: 'Months'),
          ),
          
          // Primary Y axis
          primaryYAxis: NumericAxis(
            title: AxisTitle(text: 'Sales (in thousands)'),
            minimum: 0,
            maximum: 60,
            interval: 10,
          ),
          
          // Chart series
          series: <ColumnSeries<ChartData, String>>[
            ColumnSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.sales,
              name: 'Sales',
              // Customization options
              color: Colors.blue,
              borderRadius: BorderRadius.circular(4),
              borderWidth: 1,
              borderColor: Colors.blue.shade700,
              // Spacing between columns
              spacing: 0.2,
              // Column width (0.0 to 1.0)
              width: 0.7,
              // Enable data labels
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.top,
                textStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Gradient fill
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade300,
                  Colors.blue.shade600,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ],
        ),
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