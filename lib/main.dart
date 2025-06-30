import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ui_charts_testing/column_chart.dart';
import 'package:ui_charts_testing/doughnut_chart_widget.dart';
import 'package:ui_charts_testing/line_chart.dart';
import 'package:ui_charts_testing/pie_chart.dart';
import 'package:ui_charts_testing/radial_bar_chart.dart';
import 'package:ui_charts_testing/spline_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion Charts Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RadialBarChartWidget()
      //  DoughnutChartWidget()
      // LineChartWidget(),
      //  ColumnChartPage(),
      // SplineChartPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syncfusion Charts Demo'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Line Chart
            // Container(height: 300, child: LineChart()),

            SizedBox(height: 20),

            // Column Chart
            // Container(height: 300, child: ColumnChart()),
            SizedBox(height: 20),

            // Pie Chart
            // Container(height: 300, child: PieChart()),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

List<SalesData> getChartData() {
  return [
    SalesData('2018', 25),
    SalesData('2019', 38),
    SalesData('2020', 34),
    SalesData('2021', 52),
    SalesData('2022', 40),
  ];
}
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late TooltipBehavior _tooltipBehavior;

//   @override
//   void initState() {
//     _tooltipBehavior = TooltipBehavior(enable: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: InteractiveViewer(
//             child: Container(
//               child: SfCartesianChart(
//                 primaryXAxis: CategoryAxis(), //required
//                 title: ChartTitle(text: 'Test Title'),
//                 legend: Legend(
//                   isVisible: true,
//                   position: LegendPosition.top,
//                 ), //map to the colors
//                 tooltipBehavior:
//                     _tooltipBehavior, //used to show values when putting cursor
//                 series: <LineSeries<SalesData, String>>[
//                   LineSeries<SalesData, String>(
//                     dataSource: <SalesData>[
//                       SalesData('Jan', 35),
//                       SalesData('Feb', 28),
//                       SalesData('Mar', 34),
//                       SalesData('Apr', 32),
//                       SalesData('May', 40),
//                     ],
//                     xValueMapper: (SalesData sales, _) => sales.year,
//                     yValueMapper: (SalesData sales, _) => sales.sales,
//                     dataLabelSettings: DataLabelSettings(
//                       isVisible: true,
//                     ), //determine values
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SalesData {
//   SalesData(this.year, this.sales);
//   final String year;
//   final double sales;
// }
