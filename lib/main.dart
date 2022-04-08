import 'package:flutter/material.dart';
import 'package:munch_v4/controllers/ingredients_controller.dart';
import 'package:munch_v4/controllers/popular_product_controller.dart';
import 'package:munch_v4/pages/food/munchalog_food_details.dart';
import 'package:munch_v4/pages/food/popular_food_details.dart';
import 'package:munch_v4/pages/home/food_page_body.dart';
import 'package:munch_v4/pages/home/home_page.dart';
import 'package:munch_v4/pages/home/main_food_page.dart';
import 'package:munch_v4/pages/ingredients/ingredients_page.dart';
import 'package:munch_v4/pages/welcome_page.dart';
import 'package:get/get.dart';
import 'package:munch_v4/helper/dependencies.dart' as dep;
import 'package:munch_v4/res/app_constants.dart';
import 'package:munch_v4/routes/route_helper.dart';

import 'controllers/recommended_product_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    Get.find<IngredientsController>().getCartData();

    return GetMaterialApp(
      title: AppConstants.AppName,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
