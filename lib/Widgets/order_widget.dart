import 'package:flutter/material.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/product_model.dart';

Widget orderdetail(
  Product cart,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(cart.name, style: Ordertheme.title),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Text(cart.shortdescription, style: Ordertheme.titlegrey),
          const Spacer(),
          Text(
            cart.price.toString(),
            style: Ordertheme.title,
          ),
        ],
      ),
    ],
  );
}
