import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Screens/loginpage.dart';
import 'Data/Services/product_services.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productNotifierProvider);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SHOESLY',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          backgroundColor: white,
        ),
        useMaterial3: true,
      ),
      home: LoginPage(
        product: product[0],
      ),
    );
  }
}
