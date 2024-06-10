// ignore_for_file: non_constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/Data/Model/product_model.dart';

List<Product> cart = [];

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super(cart);

  void addToCart(Product product) {
    state = [...state, product];
  }

  void removeFromCart(int pid) {
    state = [
      for (final product in state)
        if (product.pid != pid) product,
    ];
  }

  void clearCart() {
    state = [];
  }
}

final CartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) {
  return CartNotifier();
});

final priceProvider = StateProvider<double>((ref) {
  final cart = ref.watch(CartProvider);

  double sum = 0;
  for (var element in cart) {
    sum += element.price * element.qty;
  }
  return sum;
});

class QuantityNotifier extends StateNotifier<int> {
  QuantityNotifier() : super(1);

  void increment() => state++;
  void decrement() {
    if (state > 1) state--;
  }

  void update(int value) {
    if (value > 0) {
      state = value;
    }
  }
}

final quantityProvider = StateNotifierProvider<QuantityNotifier, int>((ref) {
  return QuantityNotifier();
});
