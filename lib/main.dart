import 'package:flutter/material.dart';
import 'DashBoard.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gender Predictor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: DashBoard(),
    );
  }
}

