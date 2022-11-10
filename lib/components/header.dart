// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

Widget header({required String title, context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 29),

      //Ana Menüye Dönüş buttonu
      GestureDetector(
        onTap: () {
          Feedback.forTap(context);
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 27,
        ),
      ),
      SizedBox(height: 24),
      //Ana menü başlık
      Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
