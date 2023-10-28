import 'package:Quatr/src/core/presentation/screens/discover/property_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/property_provider.dart';
import '../../../data/repositories/property_repository.dart';
import '../../../domain/entities/property.dart';
import '../../../domain/usecases/get_properties_usecase.dart';

class FeaturedListings extends StatelessWidget {
  FeaturedListings({Key? key}) : super(key: key);
  final getPropertyUseCase =
  GetPropertiesUseCase(repository: PropertyRepository());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Property>>(
      future: getPropertyUseCase.execute(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.green,
              backgroundColor: Colors.black,
              strokeWidth: 4,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<Property> properties = snapshot.data ?? [];
        //  print(properties[0].description);
          return ListView.builder(
            itemCount:  properties.length,
            itemBuilder: (ctx, index){
              final property = properties[index];
              return PropertyItem(imageUrl: property.imageUrl, description: property.description, address: property.address, rent: property.rent);
            }
          );
        }
      },
    );


  }
}
