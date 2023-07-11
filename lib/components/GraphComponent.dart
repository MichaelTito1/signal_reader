import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'dart:math' as math;

import 'package:syncfusion_flutter_charts/charts.dart';

class GraphComponent extends StatefulWidget {
  final String selectedKey;
  final List<num> time;
  final List<List<num>> dataList;
  final List<dynamic> selectedOptions;
  const GraphComponent({super.key, required this.selectedKey, required this.time, required this.dataList, required this.selectedOptions});

  @override
  State<GraphComponent> createState() => _GraphComponentState();
}

class _GraphComponentState extends State<GraphComponent> {
  late List _seriesData;
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
  void didUpdateWidget(covariant GraphComponent oldWidget) {
    _seriesData = _getSeriesData();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: widget.selectedKey),
      tooltipBehavior: _tooltipBehavior,
      zoomPanBehavior: _zoomPanBehavior,
      series: _seriesData,
      primaryXAxis: CategoryAxis(),
    );
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