import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
   PageIndicator({Key? key, required this.pageCounter, required this.isActive}) : super(key: key);
  final int pageCounter;
  final bool isActive;


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
     // curve: Curves.easeIn,
      //width: 20,
      // height: 35,
    //  padding: EdgeInsets.only(left:6, right: 6),
      duration: const Duration(milliseconds: 50),
      decoration: BoxDecoration(
          //color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      alignment: Alignment.bottomCenter,
      child: isActive ? Icon(Icons.circle, color: Colors.white, size: 14,)
            :Icon(Icons.circle, color: Colors.green[200], size: 12,),
    );
  }
}
