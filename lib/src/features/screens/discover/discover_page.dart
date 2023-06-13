import 'package:flutter/material.dart';
import '../notifications/notifications.dart';
import '../property_search/search_page.dart';
import 'full_featured_listing.dart';
import 'house_list_card.dart';

bool condition = false ;

class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final String username = "Boluwatife";

  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Column(
                children: [
                  //notifications and greetings
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Hi, $username",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  )),
                      SizedBox(width: 20),
                      IconButton(
                          padding: EdgeInsets.only(left: 45.0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  NotificationsPage()
                              ),
                            );
                          },
                          icon: Icon(Icons.notifications_outlined,
                              color: Colors.black))
                    ],
                  ),
                  //banner
                   Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.green,
                            offset: Offset(1, 1),
                            spreadRadius: 1.2,
                            blurRadius: 10),
                      ],
                      image: const  DecorationImage(
                        image: AssetImage('assets/images/black_image.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Stack(
                      children: [

                        Positioned(
                          left: 20,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height * 0.035,),
                      Text(
                            "Discover",
                             style: Theme.of(context)
                                 .textTheme
                                 .displaySmall!
                                 .copyWith(
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 20,
                                 ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                      Text(
                        textAlign: TextAlign.center,
                            "Find your next home",
                             style: Theme.of(context)
                                 .textTheme
                                 .displaySmall!
                                 .copyWith(
                                   color: Colors.white,
                                   //fontWeight: FontWeight.bold,
                                   fontSize: 12,
                                 ),
                      ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                            ],
                          ),
                        ),
                        Positioned(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                           //   color: Colors.green,
                              image: DecorationImage( image: AssetImage('assets/images/houseNig.jpg'),
                              fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.only(
                                      bottomRight: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),),
                          ),
                          top: 0,
                          right: 0,
                        )
                      ],
                    ),
                  ),
                  //search button
                  Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage())
                        );
                      },
                      child: Container(
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_rounded,
                              color: Colors.black54,
                            ),
                            Text("Search Quatr",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              //featured listings
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Featured Listings",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                  TextButton(onPressed: () {
                    Navigator.push(context,  MaterialPageRoute(builder: (context)=>
                        FullListingPage()
                    )
                    );
                  },
                    child: Text("View All",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.black,
                        fontSize: 10,
                        decoration: TextDecoration.underline),),
      )
                ],
              ),
              SizedBox(
                height: 1,
              ),
              //listings
              Expanded(
                child: Container(
                  // color: Colors.blueGrey[50],
                  width: double.infinity,
                  height: 500,
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ListCard(
                                title: "New self-con with running water",
                                address: "Bayduk, North gate",
                                price: "120,000",
                                image: "assets/images/house1.jpg"),
                            ListCard(
                              title: "Short let, very affordable",
                              address: "Green roof, stateline, South gate",
                              price: "250,000/d",
                              image: "assets/images/house2.jpg",
                            ),
                            ListCard(
                              title: "Nice self-contain with mad dogs",
                              address: "Beside Simple, West gate",
                              price: "80,000",
                              image: "assets/images/house3.jpeg",
                            ),
                            ListCard(
                              title: "Comfortable Single room with white tile",
                              address: "19 Fuji street, Oba-Ile",
                              price: "145,000",
                              image: "assets/images/house4.jpeg",
                            ),
                            ListCard(
                              title: "Premium self contain available",
                              address:
                                  "Opp Living Faith, Akad B/stp, North gate",
                              price: "110,000",
                              image: "assets/images/house5.jpg",
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


