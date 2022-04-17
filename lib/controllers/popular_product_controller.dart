import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_v4/controllers/ingredients_controller.dart';
import 'package:munch_v4/models/IngredientsModel.dart';
import 'package:munch_v4/res/colors.dart';

import '../data/repositories/popular_product_repo.dart';
import '../models/products_models.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProducList => _popularProductList;
  late IngredientsController _ingredients;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _ingredientsQuantity = 0;
  int get ingredientsQuantity => _ingredientsQuantity + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList
          .addAll(Product.fromJson(response.body).products!.toList());
      _isLoaded = true;
      //print(_popularProductList.toString());
      update();
    } else {}
  }

  void setQuantitiy(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else if (!isIncrement) {
      _quantity = checkQuantity(quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (_ingredientsQuantity + quantity < 0) {
      Get.snackbar(
        "Item count",
        "You can't reduce anymore!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      _quantity = 0;
      return _quantity;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, IngredientsController ingredients) {
    _quantity = 0;
    _ingredientsQuantity = 0;
    _ingredients = ingredients;
    var exists = false;
    exists = _ingredients.exitsInIngredients(product);
    print("exits or not" + exists.toString());
    if (exists) {
      _ingredientsQuantity = _ingredients.getQuantity(product);
    }
    print("the quantity in the cart is " + _ingredientsQuantity.toString());
  }

  void addItem(ProductModel product) {
    // in the vedio it was just _quantity > 0
    if (_quantity + _ingredientsQuantity >= 0) {
      _ingredients.addItem(product, quantity);
      _quantity = 0;
      _ingredientsQuantity = _ingredients.getQuantity(product);
    } else {
      Get.snackbar(
        "Item count",
        "You should add items to the cart",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    }
    update();
  }

  int get totalItems {
    return _ingredients.totalItems;
  }

  List<IngredientsModel> get getItems {
    return _ingredients.getItems;
  }
}
