import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService{
  
  // DatabaseService();
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final DatabaseReference ref = FirebaseDatabase.instance.ref();

  Future<Map> getData() async {
    final snapshot = await ref.child('').get();
    if(snapshot.exists){
      // print(snapshot.value);
      var allData = snapshot.value as Map;
      print(allData.keys.toList());
      return allData;
    }else{
      print('no data available.');
      return Future.error(Exception("Couldn't obtain data."));
    }
  }
}