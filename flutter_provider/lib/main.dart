import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'pages/cart_page.dart';
import 'pages/products_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/products",
      routes: {
        "/products": (context) => const ProductsPage(),
        "/cart": (context) => const CartPage(),
      },
    );
  }
}
