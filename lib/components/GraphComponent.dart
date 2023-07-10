import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'dart:math' as math;

class GraphComponent extends StatelessWidget {
  final List<num> time;
  final List<List<num>> dataList;

  const GraphComponent({super.key, required this.time, required this.dataList});

  @override
  Widget build(BuildContext context) {
    time.sort();
    List<List<FlSpot>> dataSpots = [];
    for(List<dynamic> data in dataList){
      List<FlSpot> spots = [];
      for(var pair in zip([time, data])){
        spots.add(FlSpot(pair[0] + .0, pair[1]+.0));
      }
      dataSpots.add(spots);
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: _determineChartWidth(),
        padding: EdgeInsets.all(8),
        child: LineChart(
          LineChartData(
            // minX: time.first,
            minX: 0,
            // maxX: time.last,
            lineBarsData: _getLineChartData(dataSpots)
          )
        ),
      ),
    );
  }
  
  _getLineChartData(List<List<FlSpot>> dataSpots) {
    List<LineChartBarData> lines = [];
    for(var dataSpot in dataSpots){
      lines.add(
        LineChartBarData(
          spots: dataSpot,
          color: _getRandomColor(),
          dotData: FlDotData(show: false)
        )
      );
    }
    return lines;
  }

  _getRandomColor(){
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
  
  _determineChartWidth() {
    
    double log10 = log(time.length) / ln10;
    int roundedLog = log10.round();
    num result = pow(10, roundedLog);

    return result.toDouble();

  }
}