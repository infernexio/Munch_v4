import 'package:flutter/material.dart';
import '../res/dimensions.dart';

class AppLargeText extends StatelessWidget {
   double size;
   String text;
   Color? color;
   TextOverflow overflow;

  AppLargeText( 
      {Key? key,
      this.size = 0,
      required this.text,
      this.color = const Color(0xFF332d2b),
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow, 
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size == 0?Dimensions.font20:size,
        fontWeight: FontWeight.w400
      )
    );
  }
}
