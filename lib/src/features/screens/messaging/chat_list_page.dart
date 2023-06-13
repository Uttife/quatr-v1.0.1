import 'package:Quatr/src/features/screens/messaging/chat_card.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat",), backgroundColor: Colors.black, foregroundColor: Colors.white,
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
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  ChatCard(
                    image: AssetImage("assets/images/rp8.jpg"),
                    isReceiving: true,
                    last_message: "Hi Bolu. Are you free to text now?",
                    name:"Aliozor Ruth" ,
                    time_stamp: "01:47",
                  ),
                  ChatCard(
                    image: AssetImage("assets/images/rp2.jpeg"),
                    isReceiving: true,
                    last_message: "OG are you still interested?",
                    name:"Alozie Victor",
                    time_stamp: "21:23",
                  ),
                  ChatCard(
                    image: AssetImage("assets/images/rp4.jpg"),
                    isSending: true,
                    last_message: "I'll get back to you. ",
                    name:"Ifeosame Gideon",
                    time_stamp: "20:03",
                  ),
                  ChatCard(
                    image: AssetImage("assets/images/landlord1.jpg"),
                    isReceiving: true,
                    last_message: "150k for the one upstairs. How many of you?",
                    name:"Ahmed Mokola" ,
                    time_stamp: "20:00",
                  ),
                  ChatCard(
                    image: AssetImage("assets/images/rp5.jpeg"),
                    isReceiving: true,
                    last_message: "Yes I just heard about the app too",
                    name: "Owoeye Esther",
                    time_stamp: "19;58",
                  ),
                  ChatCard(
                    isReceiving: true,
                    last_message: "because I don't have dp?",
                    name:"Judas Ikoko" ,
                    time_stamp: "18:06",
                  ),
                  ChatCard(
                    image: AssetImage("assets/images/rp6.jpg"),
                    isSending: true,
                    last_message: "I like your energy. lol",
                    name: "Oguntuase Deborah",
                    time_stamp: "17:55",
                  ),
                  ChatCard(
                    image: AssetImage("assets/images/rp3.jpg"),
                    isSending: true,
                    last_message: "Okay Boss",
                    name: "Williams David",
                    time_stamp: "17:45",
                  ),
                  ChatCard(
                    image: AssetImage("assets/images/rp7.jpg"),
                    isReceiving: true,
                    last_message: "Aiit ttyl❤",
                    name: "Aderigbe Kemi",
                    time_stamp: "1d",
                  ),
                  ChatCard(
                    image: AssetImage("assets/images/rp9.jpeg"),
                    isReceiving: true,
                    last_message: "I've spoken to the landlord",
                    name: "Folorunsho Precious",
                    time_stamp: "1d",
                  ),


                ],
              ),
            ),
            )
          ],
        ),
      )
      ,
    );
  }
}
