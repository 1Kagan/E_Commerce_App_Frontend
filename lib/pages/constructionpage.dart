// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:e_commerce_app_frontend/components//bottomNavigation.dart';
import "package:e_commerce_app_frontend/components/header.dart";

class ConstructionPage extends StatelessWidget {
  final List<Map> products = [
    {
      "fotograf": "assets/images/construction.png",
      "isim": "Henüz Ürünler Sisteme Eklenmedi!",
      "fiyat": ""
    },
    {
      "fotograf": "assets/images/construction.png",
      "isim": "Henüz Ürünler Sisteme Eklenmedi!",
      "fiyat": ""
    },
    {
      "fotograf": "assets/images/construction.png",
      "isim": "Henüz Ürünler Sisteme Eklenmedi!",
      "fiyat": ""
    },
    {
      "fotograf": "assets/images/construction.png",
      "isim": "Henüz Ürünler Sisteme Eklenmedi!",
      "fiyat": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //header
          header(
              color: Colors.white,
              title: 'Bu Sayfa Yapım Aşamasında !',
              context: context),
          SizedBox(height: 25),
          //içerik

          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 6,
                children: products.map((Map product) {
                  return buildContent(
                      photoUrl: product["fotograf"],
                      title: product["isim"],
                      price: product["fiyat"]);
                }).toList()),
          )
        ]),
      ),
      bottomNavigationBar(),
    ])));
  }
}

Widget buildContent({
  required String photoUrl,
  required String title,
  required String price,
}) {
  return GestureDetector(
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(85, 87, 85, 85),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.08),
              blurRadius: 24,
              offset: Offset(0, 16))
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Image.asset(
                  photoUrl,
                  height: 120,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    Divider(
                      height: 5,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
