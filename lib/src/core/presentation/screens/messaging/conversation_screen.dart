import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import '../../../utils/chat_info.dart';
import '../../widgets/my_text.dart';
import 'messages.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key? key, required this.name}) : super(key: key);

  final String name;


  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(title: MyText(text:widget.name, color: Colors.white,fontSize: 18,), backgroundColor: Colors.black, foregroundColor: Colors.white),
      body: Column(children: [
        Expanded(
          child: GroupedListView<Message, DateTime>(
              padding: const EdgeInsets.all(8),
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              elements: messages,
              groupBy: (message) => DateTime(
                  message.date.year, message.date.month, message.date.day),
              groupHeaderBuilder: (Message message) => DateChip(
                    color: Colors.green.shade100,
                    date: message.date,
                  ),
              itemBuilder: (context, Message message) => Align(
                    alignment: message.isSentByMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: BubbleSpecialOne(
                      text: message.text,
                      textStyle:
                      GoogleFonts.poppins(color: Colors.black,
                        ),
                      color: message.isSentByMe
                          ? Colors.green.shade50
                          : Colors.white,
                      isSender: message.isSentByMe ? true : false,
                    ),
                  )),
        ),
        Container(
          padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: controller,
              enabled: true,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              decoration:  InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: 'Type your message...',
                isDense: true,
                hintStyle:
                GoogleFonts.poppins(color: Colors.grey,
                  fontSize: 14,),
                suffixIcon:  GestureDetector(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: FaIcon(
                      FontAwesomeIcons.solidPaperPlane,
                      size: 18,
                      color: Colors.green,
                    ),
                  ),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onSubmitted: (text) {
                setState(() {
                  final message =
                  Message(date: DateTime.now(), text: text, isSentByMe: true);
                  setState(() => messages.add(message));
                });

              },


            )),
      ]),
    );
  }
}
/*
class SendMessage extends StatefulWidget {
  final String userId;
  const SendMessage({
    super.key,
    required this.userId,
  });

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        onSubmitted: (_) {
          setState(() {
            logger.i(controller.text += '\n');
            controller.text += '\n';
          });
        },
        enabled: true,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        decoration: InputDecoration(
          enabled: true,
          isDense: true,
          hintText: 'Type your message...',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          suffixIcon: GestureDetector(
            onTap: controller.text.trim().isNotEmpty
                ? () {}
                : () async {
              FocusScope.of(context).unfocus();
              logger.i(controller.text);
              try {
                await CloudFireStore()
                    .sendMessage(controller.text.trim(), widget.userId);
                controller.clear();
              } catch (e) {
                // ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.toString()),
                  ),
                );
                logger.i(e);
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: FaIcon(
                FontAwesomeIcons.solidPaperPlane,
                size: 18,
                color: AppColor.mainColor,
              ),
            ),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
*/
