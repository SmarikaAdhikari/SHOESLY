import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/product_model.dart';
import 'package:shoesly/Data/Services/cart_service.dart';

Widget orderdetail(
  Product cart,
  WidgetRef ref,
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
            '\$ ${ref.watch(priceProvider).toStringAsFixed(2)}',
            style: Ordertheme.title,
          ),
        ],
      ),
    ],
  );
}
