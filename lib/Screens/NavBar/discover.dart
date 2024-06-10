import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Services/cart_service.dart';
import 'package:shoesly/Screens/cartpage.dart';
import 'package:shoesly/Screens/filterpage.dart';
import 'package:shoesly/Widgets/shoecard_widget.dart';
import '../../Data/Model/product_model.dart';

class DiscoverPage extends ConsumerStatefulWidget {
  const DiscoverPage({super.key});

  @override
  ConsumerState<DiscoverPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(CartProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          title: const Text(
            'Discover',
            style: Apptheme.titlebar,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: Badge(
                label: Text(
                  cart.length.toString(),
                  style: const TextStyle(color: white),
                ),
                child: InkWell(
                    onTap: () {
                      Get.to(const CartPage());
                    },
                    child: Image.asset('images/icons/cart.png', height: 30)),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Column(children: [
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  Infocard(
                    title: 'All',
                    color: black,
                  ),
                  Infocard(
                    title: 'Nike',
                    color: maingrey,
                  ),
                  Infocard(
                    title: 'Jordan',
                    color: maingrey,
                  ),
                  Infocard(
                    title: 'Adidas',
                    color: maingrey,
                  ),
                  Infocard(
                    title: 'Reebok',
                    color: maingrey,
                  ),
                  Infocard(
                    title: 'Puma',
                    color: maingrey,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 2.2 / 3,
                ),
                itemCount: product.length,
                itemBuilder: (context, index) {
                  return shoesCard(
                    product[index],
                  );
                },
              ),
            )
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            extendedPadding: const EdgeInsets.all(25),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: Colors.black,
            onPressed: () {
              Get.to(const FilterPage());
            },
            label: const Row(children: [
              Icon(
                Icons.filter_list,
                color: white,
                size: 13,
              ),
              SizedBox(
                width: 10,
              ),
              Text('FILTER', style: Apptheme.float)
            ]),
          ),
        ));
  }
}

class Infocard extends StatelessWidget {
  const Infocard({
    super.key,
    required this.title,
    required this.color,
  });
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: color, fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}
