import 'package:Quatr/src/common_widgets/clickable_round_image.dart';
import 'package:Quatr/src/screens/messaging/conversation_screen.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/my_text.dart';

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
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>  ConversationPage(name: name),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ListTile(
                title: MyText(text: name, fontSize: 18,),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: isSending? MyText(text: last_message, fontSize: 15,)
                  : MyText(text: last_message, fontSize: 15, fontWeight: FontWeight.bold),
                ),
                leading:
                ClickableRoundImage(image: image, onPressed: null,
                  width: MediaQuery.of(context).size.width*0.1,
                  height: MediaQuery.of(context).size.width*0.1,
                ),
                trailing: MyText(text: time_stamp, fontSize: 13, color: Colors.grey,)

            ),
          ),
        ),
        // const Divider(color: Colors.grey, indent: 65),
      ],
    );
  }
}

//nice timer firebase duja
/*
class LastMessageTime extends StatefulWidget {
  const LastMessageTime({
    super.key,
    required this.time,
  });

  final Timestamp time;

  @override
  State<LastMessageTime> createState() => _LastMessageTimeState();
}

class _LastMessageTimeState extends State<LastMessageTime> {
  @override
  Widget build(BuildContext context) {
    var time = timeago.format(
      DateTime.fromMicrosecondsSinceEpoch(widget.time.microsecondsSinceEpoch),
      locale: 'en_short',
    );
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
    return Text(
      time + ((time == 'now') ? '' : ' ago'),
      style: const TextStyle(
          color: Colors.grey, fontWeight: FontWeight.bold),
    );
  }
}*/
