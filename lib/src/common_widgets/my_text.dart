import 'package:flutter/material.dart';
class MyText extends StatelessWidget {
  const MyText({
    super.key, required this.text,  this.color = Colors.black,  this.fontSize = 10,  this.fontWeight = FontWeight.w100,  this.textAlign = TextAlign.start,

  });
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text! ,
        textAlign: textAlign,
        maxLines: 1,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            overflow: TextOverflow.ellipsis

        ));
  }
}