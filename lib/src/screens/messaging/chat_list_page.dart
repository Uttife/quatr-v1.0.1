import 'package:Quatr/src//screens/messaging/chat_card.dart';
import 'package:flutter/material.dart';
import '../../utils/chat_info.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat",), backgroundColor: Colors.black, foregroundColor: Colors.white, elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Icon(Icons.search_rounded),
        )
      ]),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child:
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top:0.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: info.length,
                  itemBuilder: (context, index) {
                    return ChatCard(
                      isSending: (info[index]["isSending"].toString() == "true") ? true : false ,
                      last_message: info[index]['last_message'].toString(),
                      time_stamp: info[index]['time_stamp'].toString(),
                      name: info[index]['name'].toString(),
                      image: AssetImage( info[index]['image'].toString()),
                    );
                  },

                ),
              )


            ),
            )
          ],
        ),
      )
      ,
    );
  }
}
