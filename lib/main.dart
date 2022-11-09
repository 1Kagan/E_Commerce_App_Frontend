import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ana Sayfa',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
