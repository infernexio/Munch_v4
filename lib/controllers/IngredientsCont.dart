import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_v4/data/repositories/ingredients_repo.dart';
import 'package:munch_v4/models/ingredients.dart';
import 'package:munch_v4/models/products_models.dart';
import '../models/IngredientsModel.dart';
import '../res/colors.dart';

class IngredientsCont extends GetxController {
  final IngredientsRepo ingredientsRepo;

  IngredientsCont({required this.ingredientsRepo});

  Map<int, Ingredients> _items = {};
  Map<int, Ingredients> get items => _items;

  //only for shared prefrences
  List<Ingredients> storageItems = [];

  List<Ingredients> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  void addItem(Ingredients product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        return Ingredients(
            id: value.id, name: value.name, img: value.img, stars: value.stars);
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return Ingredients(
              id: product.id,
              name: product.name,
              img: product.img,
              stars: product.stars);
        });
      } else {
        Get.snackbar(
          "Item count",
          "You should add items to the cart",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
    ingredientsRepo.addToCart(getItems);
    update();
  }

  List<Ingredients> getCartData(){
    setCart = ingredientsRepo.getCartList();

    return storageItems;
  }
  set setCart(List<Ingredients> items){
    storageItems = items;
    }

  bool exitsInIngredients(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  getPopularProductList() {}
}
