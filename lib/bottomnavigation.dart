import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/Data/Model/product_model.dart';
import 'package:shoesly/Screens/NavBar/homepage.dart';
import 'package:shoesly/Screens/NavBar/discover.dart';
import 'package:shoesly/Screens/NavBar/ordersumarypage.dart';
import 'package:shoesly/Screens/NavBar/profilepage.dart';
import 'package:shoesly/Screens/NavBar/wishpage.dart';

final navProvider = StateProvider<int>((ref) => 0);

class BottomNavigationPage extends ConsumerStatefulWidget {
  const BottomNavigationPage({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  ConsumerState<BottomNavigationPage> createState() =>
      _BottomNavigationPageState();
}

class _BottomNavigationPageState extends ConsumerState<BottomNavigationPage> {
  final screens = [
    const HomePage(),
    const DiscoverPage(),
    OrderSummaryPage(product: product[0]),
    const WishlistPage(),
    ProfilePage(product: product[0]),
  ];
  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(navProvider);
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page_outlined),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        iconSize: 25,
        onTap: (value) {
          ref.read(navProvider.notifier).update((state) => value);
        },
        elevation: 6,
        backgroundColor: Colors.white,
      ),
    );
  }
}
