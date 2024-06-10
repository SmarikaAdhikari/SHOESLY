import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/product_model.dart';
import 'package:shoesly/Screens/ProductDetail/reviewpage.dart';
import 'package:shoesly/Widgets/reviews_widget.dart';

Widget topreview(
  Product product
){
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " Reviews(${product.totalReviewCount})",
          style:Producttheme.topic,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 310,
          child: ListView.builder(
            itemCount:3,
            itemBuilder: (context, index) {
              return reviewList(
              product.reviews[index],
              );
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            Get.to(ReviewPage(product: product));
          },
          child: Container(
            height: 50,
            width: 600,
            decoration: BoxDecoration(
              border: Border.all(color:maingrey),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Text(
                "View All Reviews",
                style: Apptheme.more
              ),
            ),
          ),
        )
      ],
    );
}