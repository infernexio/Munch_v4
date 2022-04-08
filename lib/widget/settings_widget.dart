import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_v4/res/dimensions.dart';
import 'package:munch_v4/widget/app_large_text.dart';

import 'app_icon.dart';

class SettingsWidget extends StatelessWidget {
  AppIcon appIcon;
  AppLargeText appLargeText;
  SettingsWidget({ Key? key, required this.appIcon, required this.appLargeText }) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.width20,
        top: Dimensions.width10,
        bottom: Dimensions.width10
      ) ,
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimensions.width15,),
          appLargeText,
        ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:  [
          BoxShadow(
            offset: Offset(0,2),
            color: Colors.grey.withOpacity(.2),
          )
          ]
        ),
    );
  }
}