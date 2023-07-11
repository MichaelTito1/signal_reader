import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:signal_reader/components/GraphComponent.dart';

class GraphScreen extends StatefulWidget {
  final String selectedKey;
  final Map<dynamic, dynamic> data;
  late List<dynamic> _selectedOptions = [];
  GraphScreen({super.key, required this.selectedKey, required this.data});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  void initState() {
    widget._selectedOptions = [];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<num> timeData = _prepareTimeData();
    List<List<num>> dataList = _prepareDataList();
    List menuOptions = widget.data.keys.where((element) => element != "time").toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.selectedKey),
      ),
      body: Column(
        children: [
          // dropdown checklist of variables
          MultiSelectDialogField(
            items: menuOptions.map((e) => MultiSelectItem(e, e)).toList(), 
            listType: MultiSelectListType.CHIP, 
            onConfirm: (values) { 
              setState(() {
                widget._selectedOptions = values;
                dataList = _prepareDataList();
              });
            },
          ),
          // graph component, passing the selected variables
          GraphComponent(time: timeData, dataList: dataList, selectedOptions: widget._selectedOptions)
        ],
      ),
    );
  }

  _prepareTimeData(){
    Map timeJson = widget.data['time'];
    List listOfObj = timeJson[timeJson.keys.elementAt(0)] as List;
    List<num> timeData = _convertListOfObjects(listOfObj);
    return timeData;
  }

  _prepareDataList(){
    List<List<num>> dataList = [];
    for(var selection in widget._selectedOptions){
      var value = widget.data[selection] as Map;
      List listOfObj = value[value.keys.elementAt(0)];
      List<num> convertedData = _convertListOfObjects(listOfObj);
      dataList.add(convertedData);
    }
    // widget.data.forEach((key, value) {
    //   if(key == 'time' || !widget._selectedOptions.contains(key)){
    //     return;
    //   }
    //   print("key=$key");
    //   value = value as Map;
      
    //   List listOfObj = value[value.keys.elementAt(0)];
    //   List<num> convertedData = _convertListOfObjects(listOfObj);
    //   dataList.add(convertedData);
    // });
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