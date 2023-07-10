import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';

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
    // print("data[0]=${dataList[0]}");


    return LineChart(
      LineChartData(
        // minX: time.first,
        minX: 0,
        // maxX: time.last,
        lineBarsData: [
          LineChartBarData(
            spots: dataSpots[3],
            color: Colors.red,
            dotData: FlDotData(show: false)
          ),
          // LineChartBarData(
          //   spots: dataSpots[1],
          //   color: Colors.amber
          // )
        ]
      )
    );
  }
}