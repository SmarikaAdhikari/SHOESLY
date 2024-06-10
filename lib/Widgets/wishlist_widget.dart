import 'package:flutter/material.dart';
import 'package:shoesly/Constants/theme.dart';

Widget wishlist() {
  return SizedBox(
    height: 120,
    child: ListView(scrollDirection: Axis.horizontal, children: [
      Container(
        height: 120,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "images/shoes/AdidasN.png",
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(" cart.name", style: Carttheme.name),
                SizedBox(height: 10),
                Text("cart.shortdescription", style: Carttheme.shordrs),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Price', style: Carttheme.price),
                    SizedBox(width: 100),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ]),
  );
}
