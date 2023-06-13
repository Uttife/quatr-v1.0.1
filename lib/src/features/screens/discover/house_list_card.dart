import 'package:flutter/material.dart';

import '../property_details/details.dart';
import 'discover_page.dart';

class ListCard extends StatefulWidget {
  ListCard({Key? key, required this.image, required this.title, required this.address, required this.price,}) : super(key: key);

  final String image;
  final String title;
  final String address;
  final String price;

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  bool isLiked =  false;
  void toggleLike(){
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(top:0, bottom: 18.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PropDetails(
              image: widget.image,
              title: widget.title,
              address: widget.address,
              price: widget.price,
              onLikeChanged: toggleLike,
              isLike: isLiked,
            )),
          );
        },

        child:
            //overall card
        Container(
          //height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white
          ),
          child: Column(
            children: [
              //image container with like button
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                padding: const EdgeInsets.all(5),
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(topLeft:
                    Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  //    color: Colors.green
                ),
                child:
                    //like button
                Stack(
                  children: [
                    Positioned(
                      child:   Container(
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,

                        ),
                        child: IconButton(
                          icon: Icon(Icons.favorite, size: 30,color: isLiked ? Colors.green[200]
                            : Colors.white54, ),
                          onPressed: () {
                            toggleLike();
                          },
                        ),
                      ),
                      top: 10,
                      right: 10,
                    ),

                  ],
                ),
              ),

             //listing details
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //title
                    Text(widget.title,maxLines: 1,overflow:TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        )),
                    //address
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.place, color: Colors.black,),
                        Text(widget.address,maxLines: 1,overflow:TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ))
                      ],
                    ),
                    //price
                    Text("N${widget.price}",maxLines: 1,overflow:TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.green,
                            fontSize: 10,
                            fontWeight: FontWeight.bold
                        )),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

