import 'dart:core';

import 'package:flutter/material.dart';

class Property with ChangeNotifier {
  final id;
  final String description;
  final String address;
  final String rent;
  final String imageUrl;
  bool isFavorite;

  Property(
      {this.isFavorite = false,
      required this.id,
      required this.description,
      required this.rent,
      required this.imageUrl,
      required this.address});

  factory Property.fromMap(Map<String, dynamic> prop) {
    return Property(
        id: prop['id'],
        description: prop['description'],
        rent: prop['rent'],
        imageUrl: prop['imageUrl'],
        address: prop['address']);
  }
}
