// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'components/bottomNavigation.dart';
import 'components/header.dart';

class CategoryPage extends StatelessWidget {
  final List<Map> products = [
    {
      "fotograf": "assets/images/iphone14pro.png",
      "isim": "Iphone 14 Pro Max",
      "fiyat": "54.000.00"
    },
    {
      "fotograf": "assets/images/iphone14.png",
      "isim": "Iphone 14 ",
      "fiyat": "30.999.00"
    },
    {
      "fotograf": "assets/images/iphone13pro.png",
      "isim": "Iphone 13 Pro Max ",
      "fiyat": "44.799.00"
    },
    {
      "fotograf": "assets/images/iphone13mini.png",
      "isim": "Iphone 13 Mini",
      "fiyat": "27.199.00"
    },
    {
      "fotograf": "assets/images/iphone12pro.png",
      "isim": "Iphone 12 Pro Max ",
      "fiyat": "30.999,00 "
    },
    {
      "fotograf": "assets/images/iphone12mini.png",
      "isim": "Iphone 12 Mini",
      "fiyat": "18.498,99"
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
          header(title: 'Akıllı Telefonlar', context: context),
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
          SizedBox(
            height: 16,
          ),
          Image.asset(
            photoUrl,
            height: 120,
            width: 1200,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
              Text("$price TL",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 255, 255))),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
