// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/product_model.dart';

Widget reviewList(
  Review review,
) {
  return Column(
    children: [
      const SizedBox(height: 10),
      Row(
        children: [
          Container(
            height: 70,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: maingrey,
              
            ),
            child: const Icon(Icons.person, color: white, size: 30),
          ),
          const SizedBox(width: 10),
          Column(children: [
            Text(review.reviewerName, style: Producttheme.price),
            const SizedBox(height: 5),
            const Row(
              children: [
                Icon(Icons.star, color: yellow, size: 12),
                Icon(Icons.star, color: yellow, size: 12),
                Icon(Icons.star, color: yellow, size: 12),
                Icon(Icons.star, color: yellow, size: 12),
                Icon(Icons.star, color: yellow, size: 12),
              ],
            ),
          ]),
          const Spacer(),
          const Text("Today", style: Producttheme.review),
        ],
      ),
      Row(
        children: [
          const SizedBox(
            width: 60,
          ),
          Expanded(
            child: Text(review.comment, style: Producttheme.name),
          ),
        ],
      ),
    ],
  );
}
