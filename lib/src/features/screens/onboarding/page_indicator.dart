/*
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({Key? key, this.pageCounter = 0, this.isActive = false})
      : super(key: key);
  final int pageCounter;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeIn,
      //width: 20,
     // height: 35,
      duration: const Duration(milliseconds: 50),
      decoration: BoxDecoration(
          color: isActive ? Colors.green : Colors.black,
          borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(5.0),
      child: Text(
        "${pageCounter + 1}",
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
*/
