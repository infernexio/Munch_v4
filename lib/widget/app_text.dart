import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
   double size;
   String text;
   Color? color;
   double height;

  AppText( 
      {Key? key,
      this.size = 12,
      required this.text,
      this.color = const Color(0xFF332d2b),
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
      )
    );
  }
}
