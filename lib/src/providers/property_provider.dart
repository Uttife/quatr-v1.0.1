import 'dart:core';

import 'package:flutter/material.dart';

import 'property.dart';

class PropertyListings with ChangeNotifier {
  final List<Property> _listings = [

    Property(
      id: '1',
        description: "New self-con with running water",
        address: "Bayduk, North gate",
        rent: "120,000",
        imageUrl: "assets/images/house1.jpg"),
    Property(
        id: '2',
        description: "Short let, very affordable",
        address: "Green roof, stateline, South gate",
        rent: "250,000/d",
        imageUrl: "assets/images/house2.jpg"),
    Property(
        id: '3',
        description: "Nice self-contain with mad dogs",
        address: "Beside Simple, West gate",
        rent: "80,000",
        imageUrl: "assets/images/house3.jpeg"),
    Property(
        id: '4',
        description: "Comfortable Single room with white tile",
        address: "19 Fuji street, Oba-Ile",
        rent: "145,000",
        imageUrl: "assets/images/house4.jpeg"),
    Property(
        id: '5',
        description: "Premium self contain available",
        address: "Opp Living Faith, Akad B/stp, North gate",
        rent: "110,000",
        imageUrl: "assets/images/house5.jpg"),
  ];

  List <Property> get listings {
   return  [..._listings];
  }

  void addProperty() {
    //_listings.add(value);
    notifyListeners();
  }

  Property findById(String id){
    return _listings.firstWhere((property) => property.id == id);
  }


}
