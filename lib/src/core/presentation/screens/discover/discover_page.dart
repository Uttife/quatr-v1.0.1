import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/my_text.dart';
import '../notifications/notifications.dart';
import '../property_search/search_page.dart';
import 'featured_properties.dart';
import 'full_featured_listing.dart';

bool condition = false;

class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final String username = "Boluwatife";

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
                  NotificationRow(username: username),

                  //banner
                  HomeBanner(),

                  //search button
                  SearchBar(),
                ],
              ),
              SizedBox(
                height: 18,
              ),

              //featured listings and view all text

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: "Featured Listings",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullListingPage()));
                    },
                    child: MyText(
                        text: "View all",
                        fontSize: 12,
                        color: Colors.green[500],
                        textAlign: TextAlign.start),
                  )
                ],
              ),

              SizedBox(
                height: 1,
              ),

              //listings
              Expanded(
                child: Container(
                  child: FeaturedListings(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: const BoxDecoration(
          boxShadow: [
            const BoxShadow(
                color: Colors.blueGrey,
                offset: Offset(1, 1),
                spreadRadius: 1.2,
                blurRadius: 10),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: Colors.black),
      child: Stack(
        children: [
          //Banner Text
          Positioned(
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.030,
                ),
                MyText(
                  text: "Discover",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0045,
                ),
                MyText(
                  text: "Find your next home",
                  fontSize: 12,
                  color: Colors.white,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
              ],
            ),
          ),
          //Banner Image
          Positioned(
            child: ClipRRect(
              child: Image.asset(
                "assets/images/houseNig.jpg",
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.36,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            top: 0,
            right: 0,
          )
        ],
      ),
    );
  }
}

class NotificationRow extends StatelessWidget {
  const NotificationRow({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyText(
            text: "Good Morning", fontWeight: FontWeight.bold, fontSize: 14),
       // SizedBox(width: 20),
        IconButton(
            padding: EdgeInsets.only(left: 45.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
            icon: Icon(Icons.notifications_outlined, color: Colors.black))
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25, bottom: 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
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
              MyText(
                text: "Search Quatr",
                fontSize: 12,
                color: Colors.black54,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

