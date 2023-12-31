import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:signal_reader/screens/GraphScreen.dart';

class SelectionComponent extends StatelessWidget {
  final String selectedKey;
  final Map<dynamic, dynamic> data;
  const SelectionComponent({super.key, required this.selectedKey, required this.data});

  @override
  Widget build(BuildContext context) {
    return data.keys.contains("time") ? 
    GraphScreen(selectedKey: selectedKey, data: data)
    :    
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(selectedKey),
      ),
      body: ListView.builder(
        itemCount: data.keys.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data.keys.elementAt(index)),
            onTap: () {
              var nextSelection = data.keys.elementAt(index);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => SelectionComponent(selectedKey: nextSelection, data: data[nextSelection])
                )
              );
            },
          );
        }
      ),
    );
     
  }
  
}