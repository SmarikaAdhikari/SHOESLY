import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/product_model.dart';
import 'package:shoesly/Data/Services/favorite_service.dart';

class ImageMethod extends ConsumerStatefulWidget {
  const ImageMethod({super.key, required this.product});
  final Product product;

  @override
  ConsumerState<ImageMethod> createState() => _ImageMethodState();
}

class _ImageMethodState extends ConsumerState<ImageMethod> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 600,
      decoration: const BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isPressed = !isPressed;
                      if (isPressed) {
                        ref
                            .read(favoriteProvider.notifier)
                            .addToFavorites(widget.product);
                      } else {
                        ref
                            .read(favoriteProvider.notifier)
                            .removeFromFavorites(widget.product);
                      }
                    });
                  },
                  icon: Icon(
                    isPressed ? Icons.favorite : Icons.favorite_border,
                    color: isPressed ? Colors.red : Colors.black,
                    size: 30,
                  ),
                ),
              ],
            ),
            Image.asset(widget.product.images[0],
                height: 180, width: 250, fit: BoxFit.cover),
            Row(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      2,
                      (index) => Container(
                        margin: const EdgeInsets.all(5),
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      1,
                      (index) => Row(
                        children: [
                          itemColor(
                            colors: maingrey,
                          ),
                          itemColor(colors: black),
                          itemColor(colors: green),
                          itemColor(colors: blue),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container itemColor({
    required Color colors,
  }) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors,
      ),
    );
  }
}
