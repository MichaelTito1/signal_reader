import 'package:flutter/material.dart';

class GraphScreen extends StatelessWidget {
  final String selectedKey;
  final Map<dynamic, dynamic> data;

  const GraphScreen({super.key, required this.selectedKey, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(selectedKey),
      ),
      body: Container(),
    );
  }
  // display a graph ?
}