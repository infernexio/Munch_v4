import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight/(844/320);
  static double pageViewContainer = screenHeight/(844/220);
  static double pageViewTextContainer = screenHeight/(844/120); 

  //dynamic height
  static double height10 = screenHeight/(844/10);
  static double height15 = screenHeight/(844/15);
  static double height20 = screenHeight/(844/20);
  static double height30 = screenHeight/(844/30);
  static double height45 = screenHeight/(844/45);

  //dynamic width
  static double width5 = screenHeight/(844/5);
  static double width10 = screenHeight/(844/10);
  static double width15 = screenHeight/(844/15);
  static double width20 = screenHeight/(844/20);
  static double width30 = screenHeight/(844/30);
  static double width45 = screenHeight/(844/45);

  //fonts
  static double font10 = screenHeight/(844/10);
  static double font15 = screenHeight/(844/15);
  static double font20 = screenHeight/(844/20);
  static double font26 = screenHeight/(844/26);


  //radius
  static double radius15 = screenHeight/(844/15);
  static double radius20 = screenHeight/(844/20);
  static double radius30 = screenHeight/(844/30);

  //iconsize
  static double iconsize24 = screenHeight/(844/24);
  static double iconsize16 = screenHeight/(844/16);

  //listviewsize
  static double listViewImgSize = screenWidth/(390/120);
  static double listViewContSize = screenWidth/(390/100);

  //Popular food 
  static double popularFoodImgSize = screenHeight/(844/350);

  //bottem height
  static double bottemHeightBar = screenHeight/(844/120);

}