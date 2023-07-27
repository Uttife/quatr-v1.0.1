import 'package:Quatr/src/screens/discover/property_item.dart';
import 'package:Quatr/src/providers/property_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeaturedListings extends StatelessWidget {
  const FeaturedListings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final propertyData = Provider.of<PropertyListings>(context);
    final properties = propertyData.listings;
    return ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemCount: properties.length,

        itemBuilder: (mContext, i) => ChangeNotifierProvider.value(
          value: properties[i] ,
          child: const PropertyItem(

          ),
        )
    );
  }
}
