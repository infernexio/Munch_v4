import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_v4/controllers/popular_product_controller.dart';
import 'package:munch_v4/controllers/recommended_product_controller.dart';
import 'package:munch_v4/pages/home/home_page.dart';
import 'package:munch_v4/pages/home/ingredients_page.dart';
import 'package:munch_v4/res/colors.dart';
import 'package:munch_v4/res/dimensions.dart';
import 'package:munch_v4/widget/app_icon.dart';
import 'package:munch_v4/widget/app_large_text.dart';
import 'package:munch_v4/widget/expandable_text.dart';
import '../../controllers/ingredients_controller.dart';
import '../../res/app_constants.dart';
import '../../routes/route_helper.dart';

class MunchalongFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  MunchalongFoodDetails({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<IngredientsController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){ 
                    // if(page == "ingredients page"){
                    // Get.toNamed(RouteHelper.ingredients);
                    // }else{
                    //   Get.toNamed(RouteHelper.initial);
                    // }
                    Navigator.of(context).pop();
                    },
                  child: AppIcon(icon: Icons.clear),
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
                                  onTap: (){
                                    Get.to(() => IngredientsPage());
                                  },
                                  child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: AppColors.mainColor,
                                ),
                                ),
                                )
                            : Container(),
                        Positioned(
                            right: 6,
                            top: 3,
                            child: AppLargeText(
                              text: Get.find<PopularProductController>()
                                  .totalItems
                                  .toString(),
                              size: 12, color: Colors.white,
                            ))
                      ],
                    );
                  }),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                20,
              ),
              child: Container(
                child: Center(
                  child: AppLargeText(
                      size: Dimensions.font26, text: product.name!),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.baseUrl + AppConstants.uploadsUrl + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: product.description!),
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height20),
                )
              ],
            )),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (controller) {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.setQuantitiy(false);
                  },
                  child: AppIcon(
                    iconSize: Dimensions.iconsize24,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove,
                    iconColor: Colors.white,
                  ),
                ),
                AppLargeText(
                  text:
                      "\$ ${product.price!}  X ${controller.ingredientsQuantity}",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                GestureDetector(
                  onTap: () {
                    controller.setQuantitiy(true);
                  },
                  child: AppIcon(
                    iconSize: Dimensions.iconsize24,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add,
                    iconColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //"- 0 +" on the screen
                Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    )),

                GestureDetector(
                  onTap: () {
                    controller.addItem(product);
                  },
                  //Price to add to cart button
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    child: AppLargeText(
                      text: "\$ ${product.price!} | Add to cart",
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor),
                  ),
                ),
              ],
            ),
          ),
        ]);
      }),
    );
  }
}
