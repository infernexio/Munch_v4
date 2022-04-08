import 'dart:io';

import 'package:flutter/material.dart';
import 'package:munch_v4/res/colors.dart';
import 'package:munch_v4/res/dimensions.dart';
import 'package:munch_v4/widget/app_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({ Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> { 
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?AppText(height: 1.8,color: AppColors.paraColor,size:Dimensions.font15, text: firstHalf):Column(
        children: [
          AppText(height: 1.8,color: AppColors.paraColor,size:Dimensions.font15, text:hiddenText?(firstHalf + "..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(children: [
              AppText(text:hiddenText? "Show More": "Show Less", color: AppColors.mainColor, size: Dimensions.font15,),
              Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColors.mainColor,)
            ]),
          )
        ],
      ),
    );
  }
}