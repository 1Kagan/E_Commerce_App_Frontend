// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_commerce_app_frontend/pages/allproductpage.dart';
import 'package:e_commerce_app_frontend/pages/constructionpage.dart';
import 'package:e_commerce_app_frontend/pages/phonepage.dart';
import 'package:e_commerce_app_frontend/components/header.dart';
import 'package:e_commerce_app_frontend/pages/monitorpage.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app_frontend/components/bottomNavigation.dart';

class CategoriesPage extends StatelessWidget {
  final List<Map> kategoriler = [
    {
      "isim": "Bütün Ürünler",
      "Sayfa": AllproductPage(),
    },
    {
      "isim": "Akıllı Telefonlar",
      "Sayfa": CategoryPage(),
    },
    {
      "isim": "Monitorler",
      "Sayfa": MonitorPage(),
    },
    {
      "isim": "Akıllı Saatler",
      "Sayfa": ConstructionPage(),
    },
    {
      "isim": "Kulaklıklar",
      "Sayfa": ConstructionPage(),
    },
    {
      "isim": "Laptoplar",
      "Sayfa": ConstructionPage(),
    },
    {
      "isim": "Aksesuarlar",
      "Sayfa": ConstructionPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Başlık Kısmı
                  header(title: 'Kategoriler', context: context),
                  SizedBox(height: 16),
                  //Kategorilerin Listelendiği Kısım
                  Expanded(
                    child: ListView(
                      children: kategoriler
                          .map((Map kategoriler) => buildkategori(
                              title: kategoriler["isim"],
                              widget: kategoriler['Sayfa'],
                              context: context))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
            //Navigation Barın olduğu Kısım
            bottomNavigationBar(),
          ],
        ),
      ),
    );
  }
}

Widget buildkategori({
  required String title,
  Widget? widget,
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: () {
      Feedback.forTap(context!);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget!;
      }));
    },
    child: Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromARGB(85, 87, 85, 85),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(159, 92, 90, 90).withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4)),
          ]),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 255, 253, 253)),
      ),
    ),
  );
}
