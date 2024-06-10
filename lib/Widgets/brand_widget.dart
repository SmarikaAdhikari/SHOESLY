import 'package:flutter/material.dart';
import 'package:shoesly/Data/Model/brand_model.dart';

Widget brandlist(
  BrandModel brand,
) {
  return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(15),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200],
              ),
              child: Image.asset(brand.brandImage, height: 30, width: 30)),
          const SizedBox(
            height: 10,
          ),
          Text(
            brand.brandName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "${brand.totalProducts}(items)",
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ));
}
