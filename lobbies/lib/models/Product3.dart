import 'package:flutter/material.dart';
//Rocket league
class Product3 {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product3({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product3> demoProducts3 = [
  Product3(
    id: 1,
    images: [
      "assets/images/cs1.png",
      "assets/images/skincs2.png",
      "assets/images/cs3.png",
      "assets/images/cs4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Saduiadbuiadbauidbaid",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product3(
    id: 2,
    images: [
      "assets/images/skincs2.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "cs2",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product3(
    id: 3,
    images: [
      "assets/images/cs3.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "cs3",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product3(
    id: 4,
    images: [
      "assets/images/cs4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "cs4",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product3(
    id: 1,
    images: [
      "assets/images/cs5.png",
      "assets/images/cs6.png",
      "assets/images/cs7.png",
      "assets/images/cs8.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "cs5",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product3(
    id: 2,
    images: [
      "assets/images/cs6.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "cs6",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product3(
    id: 3,
    images: [
      "assets/images/cs7.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "cs7",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product3(
    id: 4,
    images: [
      "assets/images/cs8.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "cs8",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
