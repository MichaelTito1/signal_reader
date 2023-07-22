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
  Map<dynamic, dynamic> allData = {};
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    db.getData().then((value) {
      setState(() {
        allData = value;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Scaffold(
            body: const Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("Please wait while we fetch data from the server...", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            )),
          )
        : SelectionComponent(selectedKey: "Signal Reader", data: allData);
  }
}
