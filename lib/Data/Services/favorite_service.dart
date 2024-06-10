import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/Data/Model/product_model.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, List<Product>>((ref) {
  return FavoriteNotifier();
});

class FavoriteNotifier extends StateNotifier<List<Product>> {
  FavoriteNotifier() : super([]);

  void addToFavorites(Product product) {
    if (!state.contains(product)) {
      state = [...state, product];
    }
  }

  void removeFromFavorites(Product product) {
    state = state.where((item) => item.pid != product.pid).toList();
  }
}
