import 'package:ct_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AreaChart extends StatelessWidget {
  const AreaChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1924, 400),
      ChartData(1925, 410),
      ChartData(1926, 405),
      ChartData(1927, 410),
      ChartData(1928, 350),
      ChartData(1929, 370),
      ChartData(1930, 500),
      ChartData(1931, 390),
      ChartData(1932, 450),
      ChartData(1933, 440),
      ChartData(1934, 400),
      ChartData(1935, 410),
      ChartData(1936, 405),
      ChartData(1937, 410),
      ChartData(1938, 350),
      ChartData(1939, 370),
      ChartData(1940, 500),
      ChartData(1941, 390),
      ChartData(1942, 450),
      ChartData(1943, 440),
    ];

    final List<Color> color = <Color>[];
    color.add(Constants.red.withOpacity(0.05));
    color.add(Constants.red.withOpacity(0.2));
    color.add(Constants.red);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors = LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: color, stops: stops);

    final List<double> yValues = chartData.map((data) => data.y).toList();
    final double minValue = yValues.reduce((value, element) => value < element ? value : element);
    final double maxValue = yValues.reduce((value, element) => value > element ? value : element);

    return SfCartesianChart(

      plotAreaBorderColor: Colors.transparent,
        primaryXAxis: const NumericAxis(isVisible: false),
        primaryYAxis: NumericAxis(isVisible: false, minimum: minValue, maximum: maxValue, interval: 50, rangePadding: ChartRangePadding.none),
        series: <CartesianSeries>[
          // Renders area chart
          AreaSeries<ChartData, int>(
              dataSource: chartData,
              borderDrawMode: BorderDrawMode.top,
              borderColor: Constants.red,
              borderWidth: 2,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              gradient: gradientColors)
        ]);
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
