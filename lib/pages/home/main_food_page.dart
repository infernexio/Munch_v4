import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_v4/pages/home/food_page_body.dart';
import 'package:munch_v4/res/colors.dart';
import 'package:munch_v4/res/dimensions.dart';
import 'package:munch_v4/res/app_constants.dart';
import 'package:munch_v4/widget/app_text.dart';

import '../../res/app_constants.dart';
import '../../widget/app_large_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  right: Dimensions.width20, left: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      AppLargeText(
                          color: AppColors.mainColor, text: AppConstants.AppName, size: Dimensions.font15*3),
                    ],
                  ),
                  Center(
                    child: Container(
                      child: Icon(Icons.search,
                          color: Colors.white, size: Dimensions.iconsize24),
                      width: Dimensions.width45,
                      height: Dimensions.height45,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              )),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: FoodPageBody(),
          ),
        ),
      ]),
    );
  }
}
