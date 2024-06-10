// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/brand_model.dart';
import 'package:shoesly/Data/Model/product_model.dart';
import 'package:shoesly/Data/Services/cart_service.dart';
import 'package:shoesly/Screens/cartpage.dart';
import 'package:shoesly/Widgets/brand_widget.dart';
import 'package:shoesly/Widgets/shoecard_widget.dart';

import '../../Data/Model/banner_model.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  PageController pageController = PageController();
  int currentindex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(CartProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Center(
          child: Text(
            'SHOESLY',
            style: Apptheme.titlebar,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: Badge(
              label: Text(
                cart.length.toString(),
                style: const TextStyle(color: white),
              ),
              child: InkWell(
                  onTap: () {
                    Get.to(const CartPage());
                  },
                  child: Image.asset('images/icons/cart.png', height: 30)),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: PageView.builder(
                controller: pageController,
                itemCount: banner.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentindex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 210,
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: grey,
                                blurRadius: 3,
                                spreadRadius: 2,
                              )
                            ],
                            color: white),
                        child: Stack(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 100.0, top: 5),
                            child: Image.asset(banner[index].image,
                                height: 120, width: 200, fit: BoxFit.cover),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "new",
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontSize: 15, color: maingrey),
                                ),
                                Text(
                                  banner[index].title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "\$${banner[index].price.toStringAsFixed(2)}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Container(
                                  height: 20,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: List.generate(banner.length,
                                        (index) => builderIndicator(index)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Brands", style: Apptheme.title),
          ),
          SizedBox(
              height: 125,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brands.length,
                itemBuilder: (context, index) => brandlist(
                  brands[index],
                ),
              )),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Special For You", style: Apptheme.title),
          ),
          SizedBox(
            height: 230,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 2.2 / 3,
              ),
              itemCount: product.length,
              itemBuilder: (context, index) {
                return shoesCard(
                  product[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container builderIndicator(int index) {
    return Container(
      height: 10,
      width: currentindex == index ? 40 : 10,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: currentindex == index ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
