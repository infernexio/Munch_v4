import 'package:munch_v4/controllers/ingredients_controller.dart';
import 'package:munch_v4/controllers/popular_product_controller.dart';
import 'package:munch_v4/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:munch_v4/data/repositories/ingredients_repo.dart';
import 'package:munch_v4/data/repositories/popular_product_repo.dart';
import 'package:munch_v4/pages/food/popular_food_details.dart';
import 'package:munch_v4/res/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/repositories/recommended_product_repo.dart';
import '../res/app_constants.dart';

Future<void> init()async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences); 
  //api Client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.baseUrl));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient:Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient:Get.find()));
  Get.lazyPut(() => IngredientsRepo(sharedPreferences: Get.find()));

  //contorlers  
  Get.lazyPut(() => PopularProductController(popularProductRepo:Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo:Get.find()));
  Get.lazyPut(() => IngredientsController(ingredientsRepo: Get.find()));
}