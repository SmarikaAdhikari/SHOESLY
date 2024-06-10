import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/product_model.dart';
import 'package:shoesly/bottomnavigation.dart';
import '../cartpage.dart';

class NextBottomSheet extends StatefulWidget {
  const NextBottomSheet({super.key, required this.product});
  final Product product;

  @override
  State<NextBottomSheet> createState() => _NextBottomSheetState();
}

class _NextBottomSheetState extends State<NextBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            const SizedBox(height: 20),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.check_circle_outline,
                color: Colors.black54,
                size: 90,
              ),
            ),
            const SizedBox(height: 20),
            const Text("Added to Cart", style: Apptheme.titlebar),
            const SizedBox(height: 10),
            const Text("Your item has been added ",
                style: Ordertheme.titlegrey),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(BottomNavigationPage(
                      product: product[0],
                    ));
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                        child: Text(
                      "BACK TO EXPLORE",
                      style: Producttheme.rating,
                    )),
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    Get.to(const CartPage());
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                        child: Text(" TO CART", style: Apptheme.float)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
