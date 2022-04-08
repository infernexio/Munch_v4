import 'package:flutter/material.dart';
import 'package:munch_v4/res/dimensions.dart';
import 'package:munch_v4/widget/app_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndText({ Key? key, 
    required this.icon, 
    required this.text, 
    required this.iconColor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,size: Dimensions.iconsize24,),
        SizedBox(width: Dimensions.width5,),
        AppText(text: text,),
      ],
    );
  }
}