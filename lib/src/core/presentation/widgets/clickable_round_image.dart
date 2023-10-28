import 'package:flutter/material.dart';

class ClickableRoundImage extends StatelessWidget {
  const ClickableRoundImage({
    super.key, required this.image, this.width = 50, this.height = 50, required this.onPressed,
  });
  final ImageProvider image;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipOval(
        child: Image(image: image, fit: BoxFit.cover,
         height: height,
        width: width,),

      ),
    );
  }
}