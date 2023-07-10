import 'package:flutter/material.dart';
import 'package:signal_reader/components/GraphComponent.dart';

class GraphScreen extends StatelessWidget {
  final String selectedKey;
  final Map<dynamic, dynamic> data;

  const GraphScreen({super.key, required this.selectedKey, required this.data});

  @override
  Widget build(BuildContext context) {
    List<num> timeData = _prepareTimeData();
    List<List<num>> dataList = _prepareDataList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(selectedKey),
      ),
      body: Stack(
        children: [
          // checklist of variables

          // graph component, passing the selected variables
          GraphComponent(time: timeData, dataList: dataList)
        ],
      ),
    );
  }
  
  _prepareTimeData(){
    Map timeJson = data['time'];
    List listOfObj = timeJson[timeJson.keys.elementAt(0)] as List;
    List<num> timeData = _convertListOfObjects(listOfObj);
    return timeData;
  }
  
  _prepareDataList(){
    List<List<num>> dataList = [];
    // iterate through key value pairs of map ?
    data.forEach((key, value) {
      if(key == 'time'){
        return;
      }
      print("key=$key");
      value = value as Map;
      
      List listOfObj = value[value.keys.elementAt(0)];
      List<num> convertedData = _convertListOfObjects(listOfObj);
      dataList.add(convertedData);
    });
    return dataList;
  }

  _convertListOfObjects(listOfObj){
    List<num> convertedData = [];
      listOfObj.forEach((element) {
        num value = element;
        if(value==null){
          return;
        }
        convertedData.add(value);
      });
    return convertedData;
  }
}