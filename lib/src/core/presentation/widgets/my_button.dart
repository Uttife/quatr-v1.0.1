import 'package:flutter/material.dart';

import 'my_text.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onpress,
    this.color = Colors.black,
    this.height = 50,
    this.width = 300
  });

  final String text;
  final  Color? color;
  final double height;
  final double width;
  final VoidCallback onpress;



  @override
  Widget build(BuildContext context) {
    return Container(
        height:height, //height of button
        width:width,
        //width of button
        child:ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: color, //background color of button
                // side: BorderSide(width:3, color:Colors.brown), //border width and color
                elevation: 3, //elevation of button
                shape: RoundedRectangleBorder( //to set border radius to button
                    borderRadius: BorderRadius.circular(5)
                ),
                padding: EdgeInsets.all(1.0) //content padding inside button
            ),
            onPressed: onpress,
            child: MyText(
                text: text,
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,)
        )
    );
  }
}