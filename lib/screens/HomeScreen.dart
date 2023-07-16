import 'package:flutter/material.dart';
import 'package:signal_reader/screens/SelectionScreen.dart';
import '../services/DatabaseService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var db = DatabaseService();
  Map<dynamic,dynamic> allData = {};
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    db.getData().then((value) {
      setState(() {
        allData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SelectionComponent(selectedKey: "Signal Reader", data: allData);
  }
}