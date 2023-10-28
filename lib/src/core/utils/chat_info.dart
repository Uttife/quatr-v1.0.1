

import '../presentation/screens/messaging/messages.dart';

const info = [
{
  'image': "assets/images/rp8.jpg",
  'isReceiving': true,
  'last_message': "Hi Bolu. Are you free to text now?",
  'name':"Aliozor Ruth" ,
  'time_stamp': "01:47",
},
{
  'image': "assets/images/rp2.jpeg",
  'isReceiving': true,
  'last_message': "OG are you still interested?",
  'name':"Alozie Victor",
  'time_stamp': "21:23",
},
{
  "image": "assets/images/rp4.jpg",
  "isSending": true,
  "last_message": "I'll get back to you. ",
  "name":"Ifeosame Gideon",
  "time_stamp": "20:03",
},
  {
    "image": "assets/images/landlord1.jpg",
    "isReceiving": true,
    "last_message": "150k for the one upstairs. How many of youuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu?",
    "name":"Ahmed Mokola" ,
    "time_stamp": "20:00",
  },

  {
    "image": "assets/images/rp5.jpeg",
    "isReceiving": true,
    "last_message": "Yes I just heard about the app too",
    "name": "Owoeye Esther",
    "time_stamp": "19;58",
  },

  {
    "image":"assets/images/blank_user.jpeg",
    "isReceiving": true,
    "last_message": "because I don't have dp?",
    "name":"Judas Ikoko" ,
    "time_stamp": "18:06",
  },
  {
    "image": "assets/images/rp6.jpg",
    "isSending": true,
    "last_message": "I like your energy. lol",
    "name": "Oguntuase Deborah",
    "time_stamp": "17:55",
  },

  {
    "image": "assets/images/rp3.jpg",
    "isSending": true,
    "last_message": "Okay Boss",
    "name": "Williams David",
    "time_stamp": "17:45",
  },

  {
    "image": "assets/images/rp7.jpg",
    "isReceiving": true,
    "last_message": "Aiit ttyl❤",
    "name": "Aderigbe Kemi",
    "time_stamp": "1d",
  },

  {
    "image": "assets/images/rp9.jpeg",
    "isReceiving": true,
    "last_message": "I've spoken to the landlord",
    "name": "Folorunsho Precious",
    "time_stamp": "1d",
  },

];

 List<Message>messages =  [
  Message(date: DateTime.now().subtract(Duration(minutes: 1)), text: 'Whats up gee, so are we running it?', isSentByMe: true),
  Message(date: DateTime.now().subtract(Duration(minutes: 1)), text: 'Yes Bro I\'m in', isSentByMe: false),
  Message(date: DateTime.now().subtract(Duration(minutes: 1)), text: 'Alright I go yarn the caretaker', isSentByMe: true),
  Message(date: DateTime.now().subtract(Duration(minutes: 1)), text: 'OK, shey make we go check the place like this?', isSentByMe: false),
  Message(date: DateTime.now().subtract(Duration(minutes: 1)), text: 'I busy today, tomorrow by 2pm nko?', isSentByMe: true),
  Message(date: DateTime.now().subtract(Duration(minutes: 1)), text: 'oya na. just update me', isSentByMe: false),
];
