import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:munch_v4/res/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/IngredientsModel.dart';
import '../../models/ingredients.dart';

class IngredientsRepo {
  final SharedPreferences sharedPreferences;
  IngredientsRepo({required this.sharedPreferences});

  List<String> cart = [];
  void addToCart(List<Ingredients> ingredientsList) {
    cart = [];
    ingredientsList.forEach((element) {
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.INGGREDIENTS_LIST, cart);
    //print(sharedPreferences.get(AppConstants.INGGREDIENTS_LIST));

    getCartList();
  }

  List<Ingredients> getCartList(){
    List<String> lists = [];
    List<Ingredients>  ingredientsList = [];

    if(sharedPreferences.containsKey(AppConstants.INGGREDIENTS_LIST)){
      lists = sharedPreferences.getStringList(AppConstants.INGGREDIENTS_LIST)!;
      print("inside the cart is" + lists.toString());
    }

    lists.forEach((element) {
      //ingredientsList.add(IngredientsModel.fromJson(jsonDecode(element)));
    });

    return ingredientsList;
  }
}
