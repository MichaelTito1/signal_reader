import 'package:flutter/material.dart';
import 'package:signal_reader/components/LoadingComponent.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/bg.png',
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          color: Colors.black45,
          colorBlendMode: BlendMode.darken,
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "\n\n\nBenha University\nBenha Faculty of Engineering\nElectrical Engineering Department",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Text(
              "Power System Stability based on FACTs and Real-Time Monitoring With Fault Detection using IoT",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Text(
              "Designed By:\nKirolos Ragaie\nSaleh Hesham",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: LoadingComponent(),
            )
          ],
        ),
      ],
    ));
  }
}
