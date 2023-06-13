import 'package:flutter/material.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
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
                  Center(child: Text("./ConversationPage " ,
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
