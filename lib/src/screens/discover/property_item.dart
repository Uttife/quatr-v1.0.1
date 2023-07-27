import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../property_details/details.dart';
import '../../providers/property.dart';
import '../../common_widgets/my_text.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final property = Provider.of<Property>(context, listen: false);
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
                        image: AssetImage(property.imageUrl),
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
                    MyText(text:property.description, fontWeight: FontWeight.bold,fontSize: 14,),
                    MyText(text: property.address, fontSize: 12, color: Colors.grey[900],),
                    MyText(text: "N${property.rent}", fontSize: 14, color: Colors.green,),

            ],
          ),
        )
          ],
        ),
    ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return PropDetails(
              imageUrl: property.imageUrl,
              description: property.description,
              address: property.address,
               rent: property.rent,
              isLike: false,
            );
          }));
        },
      )

    );
  }
}
