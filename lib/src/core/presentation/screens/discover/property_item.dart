import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/entities/property.dart';
import '../../widgets/my_text.dart';
import '../property_details/details.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({Key? key, required this.imageUrl, required this.description, required this.address, required this.rent}) : super(key: key);
  final String imageUrl;
  final String description;
  final String address;
  final String rent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        child: Card(
          elevation: 4,
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              //property image
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  color: Colors.white,

                ),
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.25,
              ),
              //property details
              ListTile(
               tileColor: Colors.white,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight:Radius.circular(10) )
                 ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    MyText(text:description, fontWeight: FontWeight.bold,fontSize: 14,),
                    MyText(text: address, fontSize: 12, color: Colors.grey[900],),
                    MyText(text: "N${rent}", fontSize: 14, color: Colors.green,),

            ],
          ),
        )
          ],
        ),
    ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return PropDetails(
              imageUrl: imageUrl,
              description: description,
              address: address,
               rent: rent,
              isLike: false,
            );
          }));
        },
      )

    );
  }
}
