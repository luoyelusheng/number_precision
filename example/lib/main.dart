import 'package:flutter/material.dart';
import 'package:number_precision/number_precision.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(0.105.toStringAsFixed(2));
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('${NP.minus(8893568.31249, -7.2550)}'),
        ),
      ),
    );
  }
}
