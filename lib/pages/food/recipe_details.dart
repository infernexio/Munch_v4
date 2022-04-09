import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:munch_v4/res/colors.dart';
import 'package:munch_v4/res/dimensions.dart';
import 'package:munch_v4/widget/app_large_text.dart';

import '../../controllers/ingredients_controller.dart';
import '../../controllers/popular_product_controller.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProducList[0];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<IngredientsController>());
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          alignment: Alignment.center,
          height: Dimensions.height45 * 1.5,
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20),
              )),
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width30),
          child: AppLargeText(
            text: "Back",
            size: Dimensions.font20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: Dimensions.height10 * 6.4,
            left: Dimensions.width10 * 1.2,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: Dimensions.width10 * 2.8),
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.star, color: Colors.white))),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.25,
              child: Text(
                "NAME OF THE FOOD THAT THE RECIPE IS OF",
                style: TextStyle(
                    fontSize: Dimensions.font15 * 2, fontFamily: "Roboto"),
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Prep Time:",
                          style: TextStyle(
                              fontSize: Dimensions.font15,
                              color: Colors.grey,
                              fontFamily: "Roboto"),
                        ),
                        SizedBox(
                          height: Dimensions.height10 * .5,
                        ),
                        Text(
                          "5" + " minutes",
                          style: TextStyle(
                              fontSize: Dimensions.font20,
                              fontFamily: "RobotoBold"),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        Text(
                          "Cook Time:",
                          style: TextStyle(
                              fontSize: Dimensions.font15,
                              color: Colors.grey,
                              fontFamily: "Roboto"),
                        ),
                        SizedBox(
                          height: Dimensions.height10 * .5,
                        ),
                        Text(
                          "15" + " minutes",
                          style: TextStyle(
                              fontSize: Dimensions.font20,
                              fontFamily: "RobotoBold"),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        Text(
                          "Total Time:",
                          style: TextStyle(
                              fontSize: Dimensions.font15,
                              color: Colors.grey,
                              fontFamily: "Roboto"),
                        ),
                        SizedBox(
                          height: Dimensions.height10 * .5,
                        ),
                        Text(
                          "20" + " minutes",
                          style: TextStyle(
                              fontSize: Dimensions.font20,
                              fontFamily: "RobotoBold"),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        Text(
                          "Serves:",
                          style: TextStyle(
                              fontSize: Dimensions.font15,
                              color: Colors.grey,
                              fontFamily: "Roboto"),
                        ),
                        SizedBox(
                          height: Dimensions.height10 * .5,
                        ),
                        Text(
                          "6" + " people",
                          style: TextStyle(
                              fontSize: Dimensions.font20,
                              fontFamily: "RobotoBold"),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/image/food0.png",
                    height: Dimensions.height10 * 25,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),
            Text(
              "Discription",
              style: TextStyle(fontSize: Dimensions.font26, fontFamily: "RobotoBold"),
            ),
            SizedBox(
              height: Dimensions.height10 * .8,
            ),
            Text(
              "Over medium heat, add 1 tablespoon of olive oil to a large skillet Add 20 ounces of Italian sausages to the pan Brown the sausages, but do not them completely through Set aside to cool slightly, then slice them into two-inch slices In the same pan, melt 1 tablespoon of butte, then if necessary, add more olive oil. Add the sliced yellow, sweet onion and the bell peppers to the pan. Cook for a couple of minutes until they are soft, but not completely cooked through. Add the 4 minced cloves of garlic, the 1/2 teaspoon of basil, 1/2 teaspoon of salt, 1/4 cup of chicken broth or white cooking wine, and the 2 cups of drained, diced tomatoes Add the sausages back to the pan and cook until they are cooked through, covering for a couple of minutes Serve!",
              style: TextStyle(fontSize: Dimensions.font20, color: Colors.grey, fontFamily: "RobotoBold"),
            ),
          ]),
        ),
      ),
    );
  }
}
