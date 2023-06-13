import 'package:Quatr/src/commom_widgets/clickable_round_image.dart';
import 'package:Quatr/src/features/screens/discover/home_page.dart';
import 'package:Quatr/src/features/screens/messaging/conversation_screen.dart';
import 'package:Quatr/src/features/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../commom_widgets/container.dart';
import '../../../commom_widgets/my_text.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({Key? key,  this.image = const AssetImage("assets/images/blank_user.jpeg"),  this.name = "Niggas InVegas",  this.last_message = 'Hey. Wanna TALK?',
     this.time_stamp = "11:07",
     this.isSending = false,  this.isReceiving = false,
 }) : super(key: key);

  final ImageProvider image;
  final bool isSending ;
  final bool isReceiving ;
  final String name;
  final String last_message;
  final String time_stamp;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
          return ConversationPage();
        }));},
        child: Container(
          decoration: BoxDecoration(color: Colors.blueGrey[50],
          ),
          padding: EdgeInsets.only(top:6, bottom: 6, right: 6, left:12),
          child: Row(
            children: [
              ClickableRoundImage(image: image, onPressed: null,
                width: MediaQuery.of(context).size.width*0.1,
                height: MediaQuery.of(context).size.width*0.1,
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: name, fontWeight: FontWeight.bold,fontSize: 16, ),

                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (isSending&&!isReceiving)
                          ?  Row(
                    children: [
                      Icon(Icons.check, size:MediaQuery.of(context).size.width*0.03, color: Colors.blueGrey,),
                     // SizedBox(width: 1,),
                      Container(
                          width:MediaQuery.of(context).size.width*0.7,
                          child: MyText(text: last_message))

                    ],
                  )
                          : Row(
                        children: [
                          Icon(Icons.circle, size: 10, color: Colors.green,),
                          SizedBox(width: 5,),
                          Container(
                            width:MediaQuery.of(context).size.width*0.5,
                              child: MyText(text: last_message))

                        ],
                      ),


                     // SizedBox(width: 10),
                      ClipRect(child: MyText(text: time_stamp ))

                    ],
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
