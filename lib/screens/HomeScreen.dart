import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:signal_reader/services/DatabaseService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var db = DatabaseService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    
    // db.test();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Signal Reader"),
      ),
      body: Center(
        child: Text("Testing home screen!!!"),
      ),
    );
  }
}