// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/product_model.dart';
import 'package:shoesly/Screens/ProductDetail/nextbottomsheet.dart';
import 'package:shoesly/Data/Services/cart_service.dart';

class BottomSheetPage extends ConsumerWidget {
  const BottomSheetPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(quantityProvider);
    final quantityController = TextEditingController(text: quantity.toString());
    final cart = ref.watch(CartProvider);

    quantityController.addListener(() {
      final value = int.tryParse(quantityController.text) ?? 1;
      ref.read(quantityProvider.notifier).update(value);
    });

    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Add to Cart",
                  style: Apptheme.titlebar,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Quantity",
              style: Producttheme.topic,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: " ",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    ref.read(quantityProvider.notifier).decrement();
                    quantityController.text = quantity.toString();
                  },
                  child: Image.asset("images/icons/sub.png",
                      height: 20, width: 20),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    ref.read(quantityProvider.notifier).increment();
                    quantityController.text = quantity.toString();
                  },
                  child: Image.asset("images/icons/add.png",
                      height: 20, width: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 70,
              width: 700,
              decoration: const BoxDecoration(
                color: white,
              ),
              child: Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Total Price",
                      style: Ordertheme.grand,
                    ),
                    Text("\$${(product.price * quantity).toStringAsFixed(2)}",
                        style: Ordertheme.title),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    final updatedProduct = product.copyWith(qty: quantity);
                    ref.read(CartProvider.notifier).addToCart(updatedProduct);
                    showMaterialModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      context: context,
                      builder: (context) => NextBottomSheet(
                        product: product,
                      ),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text("ADD TO CART", style: Apptheme.float),
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
