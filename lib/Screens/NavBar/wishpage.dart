import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Services/favorite_service.dart';

class WishlistPage extends ConsumerWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProducts = ref.watch(favoriteProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist',style: Apptheme.titlebar,),
      ),
      body: ListView.builder(
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          final product = favoriteProducts[index];
          return SizedBox(
            height: 100,
            child: ListTile(
              leading: Image.asset(product.images[0], width: 70, height: 70),
              title: Text(product.name, style: Producttheme.topic),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: () {
                  ref
                      .read(favoriteProvider.notifier)
                      .removeFromFavorites(product);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
