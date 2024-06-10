import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/product_model.dart';
import 'package:shoesly/Screens/ProductDetail/totalprice.dart';
import 'package:shoesly/Widgets/product_image.dart';
import 'package:shoesly/Widgets/topreview_widget.dart';

class ProductDetailsPage extends ConsumerStatefulWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Product product;

  @override
  ConsumerState<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends ConsumerState<ProductDetailsPage> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
        ),
        child: Stack(children: [
          SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ImageMethod(
                product: widget.product,
              ),
              const SizedBox(height: 20),
              Text(
                widget.product.name,
                style: const TextStyle(
                    color: black, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.star, color: yellow, size: 15),
                  const Icon(Icons.star, color: yellow, size: 15),
                  const Icon(Icons.star, color: yellow, size: 15),
                  const Icon(Icons.star, color: yellow, size: 15),
                  const Icon(Icons.star, color: grey, size: 15),
                  Text(widget.product.rating.toString(),
                      style: Producttheme.topic),
                  Text(
                    " (${widget.product.totalReviewCount} Reviews)",
                    style: Producttheme.review,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Size",
                style: Producttheme.topic,
              ),
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    1,
                    (index) => Row(
                      children: [
                        itemsize(label: "39"),
                        itemsize(label: "39.5"),
                        itemsize(label: "40"),
                        itemsize(label: "40.5"),
                        itemsize(
                          label: "41",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Text(
                "Description",
                style: Producttheme.topic,
              ),
              const SizedBox(height: 10),
              Text(widget.product.description, style: Producttheme.des),
              const SizedBox(height: 15),
              topreview(widget.product),
              const SizedBox(height: 100),
            ]),
          ),
          TotalPrice(product: widget.product)
        ]),
      ),
    );
  }

  Container itemsize({
    required String label,
  }) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(top: 10),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: grey),
        ),
        child:
            Text(label, textAlign: TextAlign.center, style: Producttheme.name));
  }
}
