// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

Widget bottomNavigationBar() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -3), color: Colors.black.withOpacity(0.25))
        ],
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavIcon(iconData: Icons.home_filled, active: false),
          buildNavIcon(iconData: Icons.search, active: false),
          buildNavIcon(iconData: Icons.shopping_basket, active: false),
          buildNavIcon(iconData: Icons.person, active: false),
        ],
      ),
    ),
  );
}

Widget buildNavIcon({required IconData iconData, required bool active}) {
  return Icon(
    iconData,
    size: 22,
    color: Color(active ? 0xFF0A1034 : 0xFF0A1034),
  );
}
