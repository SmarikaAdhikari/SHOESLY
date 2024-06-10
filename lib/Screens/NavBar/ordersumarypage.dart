import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/product_model.dart';
import 'package:shoesly/Data/Services/cart_service.dart';
import 'package:shoesly/Widgets/order_widget.dart';
import 'package:shoesly/bottomnavigation.dart';

class OrderSummaryPage extends ConsumerStatefulWidget {
  const OrderSummaryPage({super.key, required this.product});
  final Product product;

  @override
  ConsumerState<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends ConsumerState<OrderSummaryPage> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(CartProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Order Summary',
            style: Apptheme.titlebar,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15.0),
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Information',
                    style: Ordertheme.main,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Method',
                            style: Ordertheme.title,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Credit Card',
                            style: Ordertheme.titlegrey,
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey,
                        size: 16,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: Ordertheme.title,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Semarang Indonesia',
                            style: Ordertheme.titlegrey,
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey,
                        size: 16,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Order Detail",
                    style: Ordertheme.main,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.7,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: cart.length,
                      itemBuilder: (context, index) => orderdetail(
                        cart[index],
                        ref,
                      ),
                    ),
                  ),
                  const Text(
                    "Payment Detail",
                    style: Ordertheme.main,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Subtotal',
                        style: Ordertheme.titlegrey,
                      ),
                      Text(
                        '\$ ${ref.watch(priceProvider).toStringAsFixed(2)}',
                        style: Ordertheme.title,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping',
                        style: Ordertheme.titlegrey,
                      ),
                      Text(
                        '\$ 20.00',
                        style: Ordertheme.title,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: Ordertheme.title,
                      ),
                      Text(
                        '\$ ${(ref.watch(priceProvider) + 20).toStringAsFixed(2)}',
                        style: Ordertheme.title,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  height: 70,
                  width: 700,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          "GrandTotal",
                          style: Ordertheme.grand,
                        ),
                        Text(
                          '\$ ${(ref.watch(priceProvider) + 20).toStringAsFixed(2)}',
                          style: Ordertheme.subtitle,
                        ),
                      ],
                    ),
                    const SizedBox(width: 190),
                    InkWell(
                      onTap: () {
                        Get.to(BottomNavigationPage(product: product[0]));
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                            child: Text("PAYMENT", style: Apptheme.float)),
                      ),
                    )
                  ])),
            ),
          ]),
        ));
  }
}
