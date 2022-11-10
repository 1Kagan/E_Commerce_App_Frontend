// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  buildBaslik(),
                  buildBanner(),
                  //Buton Kısmı
                  Padding(
                    padding: EdgeInsets.only(top: 48),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildNavigation(
                              text: "Kategoriler", icon: Icons.menu),
                          buildNavigation(
                              text: "Favoriler", icon: Icons.star_border),
                          buildNavigation(
                              text: "Hediyeler", icon: Icons.card_giftcard),
                          buildNavigation(
                              text: "Çok Satanlar", icon: Icons.people),
                        ]),
                  ),
                  SizedBox(height: 40),
                  //Satış Kısmı Başlık
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Ürünler",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  //Ürünlerin Gözüktüğü Kısım
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                          text: "Akıllı Telefonlar",
                          PhotoUrl: "assets/images/iphone14pro.png",
                          discount: '-50%',
                          screenWidth: screenWidth),
                      buildSalesItem(
                          text: "Monitorler",
                          PhotoUrl: "assets/images/Monitor.png",
                          discount: '-20%',
                          screenWidth: screenWidth),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                          text: "Akıllı Saatler",
                          PhotoUrl: "assets/images/watch.png",
                          discount: '-40%',
                          screenWidth: screenWidth),
                      buildSalesItem(
                          text: "Kulaklıklar",
                          PhotoUrl: "assets/images/airpod.png",
                          discount: '-60%',
                          screenWidth: screenWidth),
                    ],
                  )
                ],
              ),
            ),
            //Botom navigation Bar
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, -3),
                        color: Colors.black.withOpacity(0.25))
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
                    buildNavIcon(
                        iconData: Icons.shopping_basket, active: false),
                    buildNavIcon(iconData: Icons.person, active: false),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildNavIcon({required IconData iconData, required bool active}) {
  return Icon(
    iconData,
    size: 22,
    color: Color(active ? 0xFF0A1034 : 0xFF0A1034),
  );
}

Widget buildBaslik() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      'Ana Ekran',
      style: TextStyle(
        fontSize: 32,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildBanner() {
  return Padding(
    padding: EdgeInsets.only(top: 24.0),
    child: Container(
      padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 244, 245),
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Apple MacBook Air M2',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '29.599,00 TL',
                style: TextStyle(
                    color: Color.fromARGB(255, 136, 136, 136),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Image.asset(
            "assets/images/macbookm2.png",
            width: 130,
            height: 110,
          ),
        ],
      ),
    ),
  );
}

Widget buildNavigation({
  required String text,
  required IconData icon,
  Widget? widget,
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: () {
      // şuan contex ve widget sahip olmadığımız için ! ve ? işaretlerini kullan
      // rak required kalıbından kurtuluyoruz ilerleyen zamanda düzenlenicek.
      Navigator.push(context!, MaterialPageRoute(builder: (context) {
        return widget!;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Icon(
            icon,
            color: Colors.black,
            size: 18,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}

Widget buildSalesItem({
  required String text,
  required PhotoUrl,
  required String discount,
  required screenWidth,
}) {
  return Container(
    width: (screenWidth - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Color.fromARGB(58, 255, 249, 249)),
          child: Text(discount,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        Center(
            child: Image.asset(
          PhotoUrl,
          height: 150,
        )),
        SizedBox(height: 5),
        Center(
          child: Text(text, style: TextStyle(fontSize: 18)),
        )
      ],
    ),
  );
}
