import 'package:flutter/material.dart';
import 'package:shop_app/components/product2_cart.dart';
import 'package:shop_app/models/Product2.dart';

import '../details/details_screen.dart';

class ProductsScreen2 extends StatelessWidget {
  const ProductsScreen2({super.key});

  static String routeName = "/products2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products2"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            itemCount: demoProducts2.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => ProductCard2(
              product2: demoProducts2[index],
              onPress: () => Navigator.pushNamed(
                context,
                DetailsScreen.routeName,
            
              ),
            ),
          ),
        ),
      ),
    );
  }
}
