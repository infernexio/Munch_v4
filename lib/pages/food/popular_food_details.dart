import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:munch_v4/controllers/ingredients_controller.dart';
import 'package:munch_v4/pages/home/home_page.dart';
import 'package:munch_v4/pages/home/main_food_page.dart';
import 'package:munch_v4/pages/ingredients/ingredients_page.dart';
import 'package:munch_v4/res/dimensions.dart';
import 'package:munch_v4/routes/route_helper.dart';
import 'package:munch_v4/widget/app_icon.dart';
import 'package:munch_v4/widget/expandable_text.dart';
import 'package:munch_v4/widget/food_info.dart';
import '../../controllers/popular_product_controller.dart';
import '../../res/app_constants.dart';
import '../../res/colors.dart';
import '../../widget/Icon&text.dart';
import '../../widget/app_large_text.dart';
import '../../widget/app_text.dart';
import 'package:get/get.dart';

class PopularFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  PopularFoodDetails({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProducList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<IngredientsController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.baseUrl +
                      AppConstants.uploadsUrl +
                      product.img!),
                ))),
          ),
          //back & Shopping cart icons
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      // if(page == "ingredients page"){
                      //   Get.toNamed(RouteHelper.ingredients);
                      // }else{
                      //   Get.toNamed(RouteHelper.initial);
                      // }
                      Get.to(HomePage());
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios),
                  ),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return Stack(
                      children: [
                        AppIcon(icon: Icons.content_paste_outlined),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(RouteHelper.ingredients);
                                  },
                                  child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: AppColors.mainColor,
                                )))
                            : Container(),
                        Positioned(
                            right: 6,
                            top: 3,
                            child: AppLargeText(
                              text: Get.find<PopularProductController>()
                                  .totalItems
                                  .toString(),
                              size: 12,
                              color: Colors.white,
                            ))
                      ],
                    );
                  }),
                ],
              )),
          //the texts of the page
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularFoodImgSize - 20,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppFoodInfo(text: product.name!),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppLargeText(text: "Introduce"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: ExpandableTextWidget(text: product.description!),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (PopularProduct) {
          return Container(
            height: Dimensions.bottemHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //"- 0 +" on the screen
                // Container(
                //     padding: EdgeInsets.only(
                //         top: Dimensions.height20,
                //         bottom: Dimensions.height20,
                //         left: Dimensions.width20,
                //         right: Dimensions.width20),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(Dimensions.radius20),
                //       color: Colors.white,
                //     ),
                //     child: Row(
                //       children: [
                //         GestureDetector(
                //           onTap: () => PopularProduct.setQuantitiy(false),
                //           child: Icon(
                //             Icons.remove,
                //             color: AppColors.signColor,
                //           ),
                //         ),
                //         SizedBox(
                //           width: Dimensions.width10,
                //         ),
                //         AppLargeText(
                //             text:
                //                 PopularProduct.ingredientsQuantity.toString()),
                //         SizedBox(
                //           width: Dimensions.width10,
                //         ),
                //         GestureDetector(
                //           onTap: () => PopularProduct.setQuantitiy(true),
                //           child: Icon(Icons.add, color: AppColors.signColor),
                //         ),
                //       ],
                //     )),
                //Price to add to cart button
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      width: Dimensions.width45*5,
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      child: Center(
                        child: AppLargeText(
                          text: "Recipe",
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
