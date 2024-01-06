import 'package:flutter/material.dart';
import 'package:shop_app/components/product2_cart.dart';
import 'package:shop_app/components/product3_cart.dart';
import 'package:shop_app/models/Product2.dart';
import 'package:shop_app/models/Product3.dart';

import '../details/details_screen.dart';

class ProductsScreen3 extends StatelessWidget {
  const ProductsScreen3({super.key});

  static String routeName = "/products3";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products3"),
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
            itemBuilder: (context, index) => ProductCard3(
              product3: demoProducts3[index],
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
