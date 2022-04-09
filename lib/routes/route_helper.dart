import 'package:get/get.dart';
import 'package:munch_v4/pages/food/popular_food_details.dart';
import 'package:munch_v4/pages/home/main_food_page.dart';
import 'package:munch_v4/pages/home/ingredients_page.dart';

import '../pages/food/munchalog_food_details.dart';
import '../pages/home/home_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFoods = "/popular-food";
  static const String recommendedFoods = "/recommended-food";
  static const String ingredients = "/ingredients";

  static String getInitial() => '$initial';
  static String getPopularFoods(int pageId,String page) => '$popularFoods?pageId=$pageId&page=$page';
  static String getRecommendedFoods(int pageId, String page) => '$recommendedFoods?pageId=$pageId&page=$page';
  static String getIngredients() => '$ingredients';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () {
        return HomePage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: popularFoods,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetails(pageId: int.parse(pageId!),page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFoods,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return MunchalongFoodDetails(pageId: int.parse(pageId!),page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: ingredients,
      page: () {
        return IngredientsPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
