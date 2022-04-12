import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:munch_v4/controllers/ingredients_controller.dart';
import 'package:munch_v4/controllers/popular_product_controller.dart';
import 'package:munch_v4/pages/home/home_page.dart';
import 'package:munch_v4/pages/home/main_food_page.dart';
import 'package:munch_v4/res/app_constants.dart';
import 'package:munch_v4/res/colors.dart';
import 'package:munch_v4/res/dimensions.dart';
import 'package:munch_v4/routes/route_helper.dart';
import 'package:munch_v4/widget/app_icon.dart';
import 'package:munch_v4/widget/app_large_text.dart';
import 'package:munch_v4/widget/app_text.dart';
import 'package:get/get.dart';

import '../../controllers/recommended_product_controller.dart';

class IngredientsPage extends StatelessWidget {
  const IngredientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child:Column(children: [
            AppLargeText(color:AppColors.mainColor ,text: "Ingredients",),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconsize24,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => HomePage());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconsize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.content_paste_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconsize24,
                  ),
                ],
              ),
            ],),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              //color: Colors.red,
              child: GetBuilder<IngredientsController>(
                  builder: (ingredientsController) {
                var ingredientsList = ingredientsController.getItems;
                return ingredientsList.length != 0 ? ListView.builder(
                    itemCount: ingredientsList.length,
                    itemBuilder: (_, index) {
                      return Container(
                        width: double.maxFinite,
                        height: Dimensions.height20 * 5,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                var popularIndex =
                                    Get.find<PopularProductController>()
                                        .popularProducList
                                        .indexOf(
                                            ingredientsList[index].Product);
                                if (popularIndex >= 0) {
                                  Get.toNamed(RouteHelper.getPopularFoods(
                                      popularIndex,"ingredients page"));
                                } else {
                                  var recommendedIndex =
                                      Get.find<RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(
                                              ingredientsList[index].Product);
                                  Get.toNamed(RouteHelper.getRecommendedFoods(
                                      recommendedIndex, "ingredients page"));
                                }
                              },
                              child: Container(
                                width: Dimensions.width20 * 5,
                                height: Dimensions.height20 * 5,
                                margin: EdgeInsets.only(
                                    bottom: Dimensions.height10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstants.baseUrl +
                                        AppConstants.uploadsUrl +
                                        ingredientsList[index].img!),
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: Dimensions.width10),
                            Expanded(
                                child: Container(
                              height: Dimensions.height20 * 5,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AppLargeText(
                                      text: ingredientsList[index].name!,
                                      color: Colors.black54,
                                    ),
                                    AppText(text: "Spicy"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppLargeText(
                                          text: ingredientsList[index]
                                              .price
                                              .toString(),
                                          color: Colors.redAccent,
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(
                                                top: Dimensions.height10,
                                                bottom: Dimensions.height10,
                                                left: Dimensions.width10,
                                                right: Dimensions.width10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () =>
                                                      ingredientsController
                                                          .addItem(
                                                              ingredientsList[
                                                                      index]
                                                                  .Product!,
                                                              -1),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width10,
                                                ),
                                                AppLargeText(
                                                    text: ingredientsList[index]
                                                        .quantity
                                                        .toString()),
                                                //  PopularProduct.ingredientsQuantity.toString()),
                                                SizedBox(
                                                  width: Dimensions.width10,
                                                ),
                                                GestureDetector(
                                                  onTap: () =>
                                                      ingredientsController
                                                          .addItem(
                                                              ingredientsList[
                                                                      index]
                                                                  .Product!,
                                                              1),
                                                  child: Icon(Icons.add,
                                                      color:
                                                          AppColors.signColor),
                                                ),
                                              ],
                                            )),
                                      ],
                                    )
                                  ]),
                            ))
                          ],
                        ),
                      );
                    }):Image.asset("assets/image/empty_cart.png");
              }),
            ),
          )
        ],
      ),
    );
  }
}