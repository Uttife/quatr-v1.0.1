import 'dart:core';

import 'package:flutter/material.dart';

class Property with ChangeNotifier {
  final  id;
  final String description;
  final String address;
  final String rent;
  final String imageUrl;
  bool isFavorite;

  Property ({
    this.isFavorite = false,
    required this.id,
    required this.description,
    required this.rent,
    required this.imageUrl,
    required this.address
});

  void toggleFavorite(){
    isFavorite =! isFavorite;
    notifyListeners();
  }


}

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    this.isFavorite = false,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.id
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }


}