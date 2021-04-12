import 'package:flutter/material.dart';
import 'package:number_precision/number_precision.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0.1 + 0.3 = ${NP.plus(0.1, 0.3)}'),
              Text('0.1 - 0.3 = ${NP.minus(0.1, 0.3)}'),
              Text('0.1 * 0.3 = ${NP.times(0.1, 0.3)}'),
              Text('0.1 / 0.3 = ${NP.round(NP.divide(0.1, 0.3), 2)}'),
            ],
          ),
        ),
      ),
    );
  }
}
