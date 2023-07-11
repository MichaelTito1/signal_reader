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
  late var _seriesData;
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    widget.time.sort();
    _seriesData = _getSeriesData();
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
      series: _seriesData
      // <ChartSeries>[
      //   LineSeries<CustomData, double>(
      //     dataSource: [
      //       CustomData(0, 1),
      //       CustomData(1, 2),
      //       CustomData(2, 6),
      //       CustomData(3, 1),
      //       CustomData(4, 8),
      //     ],
      //     xValueMapper: (CustomData data, _) => data.time,
      //     yValueMapper: (CustomData data, _) => data.data,
      //   ),
      //   LineSeries<CustomData, double>(
      //     dataSource: [
      //       CustomData(0, 7),
      //       CustomData(1, 5),
      //       CustomData(2, 3),
      //       CustomData(3, 4),
      //       CustomData(4, 18),
      //       CustomData(5, -8)
      //     ],
      //     xValueMapper: (CustomData data, _) => data.time,
      //     yValueMapper: (CustomData data, _) => data.data,
      //   )
      // ],
    );
    
  }

  _getRandomColor(){
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  List<List<CustomData>> _getChartData(){
    List<List<CustomData>> allLinesData = [];
    for (var data in widget.dataList) {
      List<CustomData> lineData = [];
      for(var pair in zip([widget.time, data])){
        lineData.add(CustomData(pair[0]+.0, pair[1]+.0));
      }
      allLinesData.add(lineData);
    }
    return allLinesData;
  }
  
  _getSeriesData() {
    List<List<CustomData>> allLinesData = _getChartData();
    List<ChartSeries> seriesData = [];
    for(var lineData in allLinesData){
      var series = LineSeries<CustomData, double>(
        dataSource: lineData,
        xValueMapper: (CustomData data, _) => data.time,
        yValueMapper: (CustomData data, _) => data.data
      );
      seriesData.add(series);
    }
    return seriesData;
  }

}

class CustomData{
  CustomData(this.time, this.data);
  final double? time;
  final double? data;
}