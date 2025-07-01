import 'dart:ui';

class ChartDataModel {
  ChartDataModel(this.month, this.sales);
  final String month;
  final double sales;
}
class RadialDataModel {
  RadialDataModel(this.category, this.value, this.color);
  final String category;
  final double value;
  final Color color;
}