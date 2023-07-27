import 'package:Quatr/src/common_widgets/my_text.dart';
import 'package:flutter/material.dart';

class MyRowContainer extends StatelessWidget {
  MyRowContainer({
    super.key, required this.icon, required this.desc,  this.containerColor = Colors.transparent, this.padding = const EdgeInsets.all(6.0),
    this.width, this.onClicked, this.paddingWContainer =  const EdgeInsets.all(0.0), this.iconColor = Colors.black, this.descColor = Colors. black,
    this.fontsize =10,
    this.borderRadius =  const BorderRadius.all(Radius.circular(0)),
    this.textFontWeight = FontWeight.w100
  });
  final IconData icon;
  final String desc;
  final Color? containerColor;
  final EdgeInsets padding;
  final EdgeInsets paddingWContainer;
  final width;
  final VoidCallback? onClicked;
  final Color? iconColor;
  final Color? descColor;
  final double fontsize;
  final BorderRadiusGeometry borderRadius;
  final FontWeight textFontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        child: Container(
          padding: paddingWContainer,
          width: width,
          decoration: BoxDecoration(color: containerColor,
            borderRadius: borderRadius,

          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor),
              SizedBox(width: 5,),

              Flexible(
                  fit: FlexFit.loose,
                  child: MyText(text: desc, color:descColor,fontSize:fontsize, fontWeight: textFontWeight,))

            ],
          ),
        ),
        onTap:
  onClicked,
      ),

    );
  }
}