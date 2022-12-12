import 'package:flutter/material.dart';
import 'package:flutter_application_test/widgets/home_store_screen.dart';
import 'package:flutter_application_test/widgets/my_cart.dart';
import 'package:flutter_application_test/widgets/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/widgets/home_store_screen': (context) => const HomeStoreScreen(),
        '/widgets/product_detail_screen': (context) => ProductDetailScreen(),
        '/widgets/my_cart': (context) => MyCart(),
      },
      initialRoute: '/widgets/home_store_screen',
      title: 'Flutter Test App',
      home: const HomeStoreScreen(),
    );
  }
}
