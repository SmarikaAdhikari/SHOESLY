import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/product_model.dart';
import 'package:shoesly/Screens/ProductDetail/bottomsheet.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
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
                  "Price",
                  style: Ordertheme.grand,
                ),
                Text(
                  "\$${product.price.toString()}",
                  style: Ordertheme.title,
                ),
              ],
            ),
            const SizedBox(
              width: 200,
            ),
            InkWell(
              onTap: () {
                showMaterialModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  context: context,
                  builder: (context) => Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: BottomSheetPage(
                        product: product,
                      )),
                );
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                    child: Text("ADD TO CART", style: Apptheme.float)),
              ),
            )
          ])),
    );
  }
}
