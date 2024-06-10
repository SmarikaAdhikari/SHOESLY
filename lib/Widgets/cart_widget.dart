import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Services/cart_service.dart';
import '../Data/Model/product_model.dart';

Widget cartWidget(
  Product cart,
  WidgetRef ref,
) {
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
              width: 110,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Image.asset(
                cart.images[0],
                height: 110,
                width: 110,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cart.name, style: Carttheme.name),
                const SizedBox(height: 10),
                Text(cart.shortdescription, style: Carttheme.shordrs),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text('\$${cart.price * cart.qty}', style: Carttheme.price),
                    const SizedBox(width: 100),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(width: 100),
      Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15),
        child: InkWell(
          onTap: () {
            ref.read(CartProvider.notifier).removeFromCart(cart.pid);
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 95,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              color: Color.fromARGB(255, 218, 91, 82),
            ),
            child: const Icon(Icons.delete_outline_rounded,
                color: Colors.white, size: 30),
          ),
        ),
      )
    ]),
  );
}
