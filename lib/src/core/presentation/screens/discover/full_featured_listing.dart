import 'package:flutter/material.dart';

class FullListingPage extends StatefulWidget {
  const FullListingPage({Key? key}) : super(key: key);

  @override
  State<FullListingPage> createState() => _FullListingPageState();
}

class _FullListingPageState extends State<FullListingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Featured Listings'), backgroundColor: Colors.white54, foregroundColor: Colors.black),
      body: Column(
          children: [
            Expanded(child:
            Container(
              padding: EdgeInsets.all(20),
              child:
              ListView(
                children: [
                  Center(child: Text("./AllFeaturedListings " ,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        //        height: 1.2
                      )),)
                ],
              ),
            ),
            ),

          ]
      ),
    );
  }
}
