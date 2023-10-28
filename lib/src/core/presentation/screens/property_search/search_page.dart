import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text('Notifications'), backgroundColor: Colors.black),
      body: Column(
          children: [
            Expanded(child:
            Container(
              padding: EdgeInsets.all(20),
              child:
              ListView(
                children: [
                  Center(child: Text("./SearchHandlingPage " ,
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
