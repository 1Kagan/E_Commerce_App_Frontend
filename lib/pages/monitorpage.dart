// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:e_commerce_app_frontend/components//bottomNavigation.dart';
import "package:e_commerce_app_frontend/components/header.dart";

import 'productdetailpage.dart';

class MonitorPage extends StatelessWidget {
  final List<Map> products = [
    {
      "fotograf": "assets/images/aoc100hz.png",
      "isim": "Aoc Curved 34″1ms Monitor",
      "fiyat": "7.910,45",
      "Sayfa": ProductDetailPage()
    },
    {
      "fotograf": "assets/images/gamepower4k.png",
      "isim": "Gigabyte 1ms 165Hz Monitor ",
      "fiyat": "17.931,08",
      "Sayfa": ProductDetailPage(),
    },
    {
      "fotograf": "assets/images/benqmonitor.png",
      "isim": "BenQ IPS 1ms 165Hz Monitor ",
      "fiyat": "6.122,81",
      "Sayfa": ProductDetailPage(),
    },
    {
      "fotograf": "assets/images/asusmonitor.png",
      "isim": "Asus 27″ROG Gaming Monitor",
      "fiyat": "11.999,00",
      "Sayfa": ProductDetailPage(),
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
          header(color: Colors.white, title: 'Monitorler', context: context),
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
                      price: product["fiyat"],
                      widget: product['Sayfa'],
                      context: context);
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
  required Widget widget,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      Feedback.forTap(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
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
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    Divider(
                      height: 5,
                      color: Colors.transparent,
                    ),
                    Text("$price TL",
                        style: TextStyle(
                            fontSize: 11,
                            color: Color.fromARGB(255, 255, 255, 255))),
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
