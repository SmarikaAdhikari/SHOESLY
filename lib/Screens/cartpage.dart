import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/product_model.dart';
import 'package:shoesly/Data/Services/product_services.dart';
import 'package:shoesly/Data/Services/cart_service.dart';
import 'package:shoesly/Screens/NavBar/ordersumarypage.dart';
import 'package:shoesly/Widgets/cart_widget.dart';
import 'package:shoesly/bottomnavigation.dart';

class CartPage extends ConsumerWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(CartProvider);
    final products = ref.watch(productNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cart',
            style: Apptheme.titlebar,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.to(BottomNavigationPage(product: products[0]));
            },
          ),
        ),
        body: Stack(children: [
          Column(children: [
            SingleChildScrollView(
              child: SizedBox(
                height: 660,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    return cartWidget(
                      cart[index],
                      ref,
                    );
                  },
                ),
              ),
            ),
          ]),
          totalmethod(
            products[0],
            ref,
          ),
        ]));
  }

  Positioned totalmethod(
    Product product,
    WidgetRef ref,
  ) {
    return Positioned(
      bottom: 0,
      child: Container(
          height: 70,
          width: 700,
          decoration: const BoxDecoration(
            color: white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "GrandTotal",
                    style: Ordertheme.grand,
                  ),
                  Text(
                    '\$ ${ref.watch(priceProvider).toStringAsFixed(2)}',
                    style: Ordertheme.title,
                  ),
                ],
              ),
              const SizedBox(
                width: 200,
              ),
              InkWell(
                onTap: () {
                  Get.to(OrderSummaryPage(product: product));
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                      child: Text("CHECK OUT", style: Apptheme.float)),
                ),
              )
            ]),
          )),
    );
  }
}
