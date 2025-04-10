import 'package:flutter/material.dart';
import 'package:project/models/shop.dart';
import 'package:project/pages/IntroPage.dart';
import 'package:project/pages/cart_page.dart';
import 'package:project/pages/shop_page.dart';
import 'package:project/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(),
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
      routes: {
        '/IntroPage': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },

    );
  }
}
