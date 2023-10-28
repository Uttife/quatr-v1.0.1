class Message {
  const  Message(
      { required this.date,required this.text ,required this.isSentByMe
      });

  final String text;
  final bool isSentByMe;
  final DateTime date;

}