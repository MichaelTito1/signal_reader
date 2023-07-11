import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'dart:math' as math;

import 'package:syncfusion_flutter_charts/charts.dart';

class GraphComponent extends StatefulWidget {
  final List<num> time;
  final List<List<num>> dataList;
  const GraphComponent({super.key, required this.time, required this.dataList});

  @override
  State<GraphComponent> createState() => _GraphComponentState();
}

class _GraphComponentState extends State<GraphComponent> {
  late List<CustomData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    widget.time.sort();
    _chartData = _getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true, 
      enablePanning: true
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return SfCartesianChart(
      tooltipBehavior: _tooltipBehavior,
      zoomPanBehavior: _zoomPanBehavior,
      series: <ChartSeries>[
        LineSeries<CustomData, double>(
          dataSource: _chartData,
          xValueMapper: (CustomData data, _) => data.time,
          yValueMapper: (CustomData data, _) => data.data,
        )
      ],
    );
    
  }

  _getRandomColor(){
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  _getChartData(){
    final List<CustomData> data = [
      CustomData(0, 1),
      CustomData(1, 2),
      CustomData(2, 6),
      CustomData(3, 1),
      CustomData(4, 8),
      CustomData(5, 7),
      CustomData(6, 5),
      CustomData(7, 3),
      CustomData(8, 4),
      CustomData(9, 18),
      CustomData(10, -8),
    ];
    return data;
  }
}

class CustomData{
  CustomData(this.time, this.data);
  final double? time;
  final double? data;
}