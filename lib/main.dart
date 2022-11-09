// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                //Başlık,Banner,Butonlar ve Satış kısmından oluşucak.
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 32,
                      color: Color(0xFF0A1034),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
