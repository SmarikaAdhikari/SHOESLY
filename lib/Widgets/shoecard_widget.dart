import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Screens/ProductDetail/productdetails.dart';
import '../Data/Model/product_model.dart';

Widget shoesCard(Product product) {
  return InkWell(
    onTap: () {
      Get.to(ProductDetailsPage(product: product));
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 170,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    product.brandimage,
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset(
                      product.images[0],
                      height: 80,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.name,
            style: Producttheme.name
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow, size: 12),
              const SizedBox(width: 5),
              Text(
                product.rating.toString(),
                style: Producttheme.rating
              ),
              const SizedBox(width: 5),
              Text(
                "(${product.totalReviewCount} Reviews)",
                style:Producttheme.review
              ),
            ],
          ),
          Text(
            "\$${product.price.toString()}",
            style:Producttheme.price
          ),
        ],
      ),
    ),
  );
}

