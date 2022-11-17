// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import '../components/header.dart';
import '../controller/product_controller.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final ProductController productController = Get.put(ProductController());

  final List<String> availableStorages = ['128GB', '256GB', '512GB', '1TB'];
  int _selectedIndex = 1;

  final List<SmProduct> smProducts = [
    SmProduct(image: 'assets/images/iphone13pro.png'),
    SmProduct(image: 'assets/images/iphone12pro.png'),
    SmProduct(image: 'assets/images/iphone13mini.png'),
    SmProduct(image: 'assets/images/iphone12mini.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(
              color: Color.fromARGB(255, 255, 252, 252),
              title: '',
              context: context),
          Container(
            height: MediaQuery.of(context).size.height * .25,
            padding: const EdgeInsets.only(bottom: 1),
            width: double.infinity,
            child: Image.asset(
              'assets/images/iphone14pro.png',
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                'Iphone 14 Pro Max',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                "54000 TL",
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 97, 95, 95),
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: availableStorages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => setState(() {
                    _selectedIndex = index;
                  }),
                  child: storageWidget(
                      _selectedIndex == index, availableStorages[index]),
                );
              },
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40, right: 14, left: 14),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Dayanıklılık için tasarlandı.Tüm akıllı telefon camlarından daha sağlam olan Ceramic Shield. Suya dayanıklı tasarım.1 Cerrahi sınıf paslanmaz çelik. 6.1 inç ve 6.7 inç ekran boyutları.2 Ve dört Pro renk seçeneği.',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        const Image(
                            image: AssetImage('assets/images/appleinfo2.gif')),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Karşınızda Dynamic Island. Gerçek bir Apple inovasyonu. Hem donanım hem yazılım hem de ikisinin ortası. Dynamic Island, sizi o an yaptığınız şeyden uzaklaştırmadan müziğinizi, maç skorlarını, FaceTime’ı ve daha fazlasını hop diye gözünüzün önüne getiriyor.',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'Benzer Ürünler',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 110,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: smProducts.length,
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.only(right: 6),
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(141, 71, 70, 70),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Image(
                                  height: 80,
                                  image: AssetImage(smProducts[index].image),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Color.fromARGB(255, 0, 0, 0),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Icon(
                Ionicons.heart,
                size: 30,
                color: Color.fromARGB(255, 173, 87, 87),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: InkWell(
                onTap: () {
                  productController.addToCart();
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 253, 253),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Obx(
                    () => productController.isAddLoading.value
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Color.fromARGB(255, 0, 0, 0),
                              strokeWidth: 3,
                            ),
                          )
                        : Text(
                            'Sepete Ekle',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmProduct {
  final String image;
  SmProduct({required this.image});
}

Widget storageWidget(isSelected, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      alignment: Alignment.center,
      width: 75,
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Color.fromARGB(255, 214, 197, 248),
        border: Border.all(color: Colors.white, width: isSelected ? 2 : 0),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black),
      ),
    ),
  );
}
