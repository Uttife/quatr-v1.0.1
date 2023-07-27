import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications'), backgroundColor: Colors.black),
      body: Column(
        children: [
          Expanded(child:
              Container(
                padding: EdgeInsets.all(20),
                child:
                  ListView(
                     children: [
                       Center(child: Text("./NotificationPage " ,
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
