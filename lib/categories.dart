// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_commerce_app_frontend/category.dart';
import 'package:e_commerce_app_frontend/components/header.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app_frontend/components/bottomNavigation.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> kategoriler = [
    'Bütün Ürünler',
    'Akıllı Telefonlar',
    'Akıllı Saatler',
    'Kulaklıklar',
    'Bilgisayarlar',
    'Aksesuarlar'
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
                          .map((String title) =>
                              buildkategori(title: title, context: context))
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

Widget buildkategori({required String title, context}) {
  return GestureDetector(
    onTap: () {
      Feedback.forTap(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CategoryPage();
      }));
    },
    child: Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4)),
          ]),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    ),
  );
}
