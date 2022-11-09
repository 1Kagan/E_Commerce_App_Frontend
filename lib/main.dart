// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ThemeClass {
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: ColorScheme.dark(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeClass.darkTheme,
      title: 'Ana Sayfa',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
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
