import 'package:ct_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CandleChart extends StatefulWidget {
  const CandleChart({super.key});

  @override
  State<CandleChart> createState() => _CandleChartState();
}

class _CandleChartState extends State<CandleChart> {
  late List<_ChartData> data;

  late double closeMinimum, closeMaximum;

  @override
  void initState() {
    data = [
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1668297600000),
        open: 16813.16000000,
        high: 16954.28000000,
        low: 16229.00000000,
        close: 16329.85000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1668384000000),
        open: 16331.78000000,
        high: 17190.00000000,
        low: 15815.21000000,
        close: 16619.46000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1668470400000),
        open: 16617.72000000,
        high: 17134.69000000,
        low: 16527.72000000,
        close: 16900.57000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1668556800000),
        open: 16900.57000000,
        high: 17015.92000000,
        low: 16378.61000000,
        close: 16662.76000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1668643200000),
        open: 16661.61000000,
        high: 16751.00000000,
        low: 16410.74000000,
        close: 16692.56000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1668729600000),
        open: 16692.56000000,
        high: 17011.00000000,
        low: 16546.04000000,
        close: 16700.45000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1668816000000),
        open: 16699.43000000,
        high: 16822.41000000,
        low: 16553.53000000,
        close: 16700.68000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1668902400000),
        open: 16700.68000000,
        high: 16753.33000000,
        low: 16180.00000000,
        close: 16280.23000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1668988800000),
        open: 16279.50000000,
        high: 16319.00000000,
        low: 15476.00000000,
        close: 15781.29000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1669075200000),
        open: 15781.29000000,
        high: 16315.00000000,
        low: 15616.63000000,
        close: 16226.94000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1669161600000),
        open: 16227.96000000,
        high: 16706.00000000,
        low: 16160.20000000,
        close: 16603.11000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1669248000000),
        open: 16603.11000000,
        high: 16812.63000000,
        low: 16458.05000000,
        close: 16598.95000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1669334400000),
        open: 16599.55000000,
        high: 16666.00000000,
        low: 16342.81000000,
        close: 16522.14000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1669420800000),
        open: 16521.35000000,
        high: 16701.99000000,
        low: 16385.00000000,
        close: 16458.57000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1669507200000),
        open: 16457.61000000,
        high: 16600.00000000,
        low: 16401.00000000,
        close: 16428.78000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1669593600000),
        open: 16428.77000000,
        high: 16487.04000000,
        low: 15995.27000000,
        close: 16212.91000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1669680000000),
        open: 16212.18000000,
        high: 16548.71000000,
        low: 16100.00000000,
        close: 16442.53000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1669766400000),
        open: 16442.91000000,
        high: 17249.00000000,
        low: 16428.30000000,
        close: 17163.64000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1669852800000),
        open: 17165.53000000,
        high: 17324.00000000,
        low: 16855.01000000,
        close: 16977.37000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1669939200000),
        open: 16978.00000000,
        high: 17105.73000000,
        low: 16787.85000000,
        close: 17092.74000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1670025600000),
        open: 17092.13000000,
        high: 17188.98000000,
        low: 16858.74000000,
        close: 16885.20000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1670112000000),
        open: 16885.20000000,
        high: 17202.84000000,
        low: 16878.25000000,
        close: 17105.70000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1670198400000),
        open: 17106.65000000,
        high: 17424.25000000,
        low: 16867.00000000,
        close: 16966.35000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1670284800000),
        open: 16966.35000000,
        high: 17107.01000000,
        low: 16906.37000000,
        close: 17088.96000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1670371200000),
        open: 17088.96000000,
        high: 17142.21000000,
        low: 16678.83000000,
        close: 16836.64000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1670457600000),
        open: 16836.64000000,
        high: 17299.00000000,
        low: 16733.49000000,
        close: 17224.10000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1670544000000),
        open: 17224.10000000,
        high: 17360.00000000,
        low: 17058.21000000,
        close: 17128.56000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1670630400000),
        open: 17128.56000000,
        high: 17227.72000000,
        low: 17092.00000000,
        close: 17127.49000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1670716800000),
        open: 17127.49000000,
        high: 17270.99000000,
        low: 17071.00000000,
        close: 17085.05000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1670803200000),
        open: 17085.05000000,
        high: 17241.89000000,
        low: 16871.85000000,
        close: 17209.83000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1670889600000),
        open: 17208.93000000,
        high: 18000.00000000,
        low: 17080.14000000,
        close: 17774.70000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1670976000000),
        open: 17775.82000000,
        high: 18387.95000000,
        low: 17660.94000000,
        close: 17803.15000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1671062400000),
        open: 17804.01000000,
        high: 17854.82000000,
        low: 17275.51000000,
        close: 17356.34000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1671148800000),
        open: 17356.96000000,
        high: 17531.73000000,
        low: 16527.32000000,
        close: 16632.12000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1671235200000),
        open: 16631.50000000,
        high: 16796.82000000,
        low: 16579.85000000,
        close: 16776.52000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1671321600000),
        open: 16777.54000000,
        high: 16863.26000000,
        low: 16663.07000000,
        close: 16738.21000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1671408000000),
        open: 16739.00000000,
        high: 16815.99000000,
        low: 16256.30000000,
        close: 16438.88000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1671494400000),
        open: 16438.88000000,
        high: 17061.27000000,
        low: 16397.20000000,
        close: 16895.56000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1671580800000),
        open: 16896.15000000,
        high: 16925.00000000,
        low: 16723.00000000,
        close: 16824.67000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1671667200000),
        open: 16824.68000000,
        high: 16868.52000000,
        low: 16559.85000000,
        close: 16821.43000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1671753600000),
        open: 16821.90000000,
        high: 16955.14000000,
        low: 16731.13000000,
        close: 16778.50000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1671840000000),
        open: 16778.52000000,
        high: 16869.99000000,
        low: 16776.62000000,
        close: 16836.12000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1671926400000),
        open: 16835.73000000,
        high: 16857.96000000,
        low: 16721.00000000,
        close: 16832.11000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1672012800000),
        open: 16832.11000000,
        high: 16944.52000000,
        low: 16791.00000000,
        close: 16919.39000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1672099200000),
        open: 16919.39000000,
        high: 16972.83000000,
        low: 16592.37000000,
        close: 16706.36000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1672185600000),
        open: 16706.06000000,
        high: 16785.19000000,
        low: 16465.33000000,
        close: 16547.31000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1672272000000),
        open: 16547.32000000,
        high: 16664.41000000,
        low: 16488.91000000,
        close: 16633.47000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1672358400000),
        open: 16633.47000000,
        high: 16677.35000000,
        low: 16333.00000000,
        close: 16607.48000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1672444800000),
        open: 16607.48000000,
        high: 16644.09000000,
        low: 16470.00000000,
        close: 16542.40000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1672531200000),
        open: 16541.77000000,
        high: 16628.00000000,
        low: 16499.01000000,
        close: 16616.75000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1672617600000),
        open: 16617.17000000,
        high: 16799.23000000,
        low: 16548.70000000,
        close: 16672.87000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1672704000000),
        open: 16672.78000000,
        high: 16778.40000000,
        low: 16605.28000000,
        close: 16675.18000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1672790400000),
        open: 16675.65000000,
        high: 16991.87000000,
        low: 16652.66000000,
        close: 16850.36000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1672876800000),
        open: 16850.36000000,
        high: 16879.82000000,
        low: 16753.00000000,
        close: 16831.85000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1672963200000),
        open: 16831.85000000,
        high: 17041.00000000,
        low: 16679.00000000,
        close: 16950.65000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1673049600000),
        open: 16950.31000000,
        high: 16981.91000000,
        low: 16908.00000000,
        close: 16943.57000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1673136000000),
        open: 16943.83000000,
        high: 17176.99000000,
        low: 16911.00000000,
        close: 17127.83000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1673222400000),
        open: 17127.83000000,
        high: 17398.80000000,
        low: 17104.66000000,
        close: 17178.26000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1673308800000),
        open: 17179.04000000,
        high: 17499.00000000,
        low: 17146.34000000,
        close: 17440.66000000,
      ),
      _ChartData(
        x: DateTime.fromMillisecondsSinceEpoch(1673395200000),
        open: 17440.64000000,
        high: 18000.00000000,
        low: 17315.60000000,
        close: 17943.26000000,
      ),
    ];

    closeMinimum = 0;
    closeMaximum = 0;
    for (int i = 0; i < data.length; i++) {
      if (data[i].close < closeMinimum) {
        closeMinimum = data[i].close;
      }
      if (data[i].close > closeMaximum) {
        closeMaximum = data[i].close;
      }
      if (closeMaximum < data[i].high) {
        closeMaximum = data[i].high;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<double> yValuesLow = data.map((data) => data.low).toList();
    final List<double> yValuesHigh = data.map((data) => data.high).toList();
    final double minValue =
        yValuesLow.reduce((value, element) => value < element ? value : element);
    final double maxValue =
        yValuesHigh.reduce((value, element) => value > element ? value : element);

    return SfCartesianChart(
        trackballBehavior: TrackballBehavior(
            enable: true,
            activationMode: ActivationMode.singleTap,
            lineDashArray: <double>[5, 5],
            lineColor: Constants.grey_text),
        zoomPanBehavior: ZoomPanBehavior(enablePanning: true, zoomMode: ZoomMode.x),
        primaryXAxis: DateTimeAxis(
          interval: 7,
          dateFormat: DateFormat('yyyy-MM-dd'),
          autoScrollingDelta: 35,
          autoScrollingMode: AutoScrollingMode.end,
        ),
        primaryYAxis: NumericAxis(
          initialVisibleMinimum: closeMinimum,
          initialVisibleMaximum: closeMaximum,
          rangePadding: ChartRangePadding.round,
          opposedPosition: true,
          numberFormat: NumberFormat.currency(decimalDigits: 0, symbol: ''),
        ),
        series: <CandleSeries<_ChartData, DateTime>>[
          CandleSeries<_ChartData, DateTime>(
            dataSource: data,
            xValueMapper: (_ChartData sales, _) => sales.x,
            lowValueMapper: (_ChartData sales, _) => sales.low,
            highValueMapper: (_ChartData sales, _) => sales.high,
            openValueMapper: (_ChartData sales, _) => sales.open,
            closeValueMapper: (_ChartData sales, _) => sales.close,
            bearColor: Constants.red,
            bullColor: Constants.primary_color,
            enableSolidCandles: true,
          )
        ]);
  }
}

class _ChartData {
  _ChartData(
      {required this.x,
      required this.high,
      required this.low,
      required this.open,
      required this.close});

  final DateTime x;
  final double high;
  final double low;
  final double open;
  final double close;
}
