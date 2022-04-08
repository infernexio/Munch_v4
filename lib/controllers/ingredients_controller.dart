import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_v4/data/repositories/ingredients_repo.dart';
import 'package:munch_v4/models/products_models.dart';
import '../models/IngredientsModel.dart';
import '../res/colors.dart';

class IngredientsController extends GetxController {
  final IngredientsRepo ingredientsRepo;

  IngredientsController({required this.ingredientsRepo});

  Map<int, IngredientsModel> _items = {};
  Map<int, IngredientsModel> get items => _items;

  //only for shared prefrences
  List<IngredientsModel> storageItems = [];

  List<IngredientsModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return IngredientsModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          products: product,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return IngredientsModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            products: product,
          );
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

  bool exitsInIngredients(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach(((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      }));
    }
    return quantity;
  }

  int get totalItems {
    int totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity = (totalQuantity + value.quantity!) as int;
    });
    return totalQuantity;
  }

  List<IngredientsModel> getCartData(){
    setCart = ingredientsRepo.getCartList();

    return storageItems;
  }

  set setCart(List<IngredientsModel> items){
    storageItems = items;

    for(int i = 0; i < storageItems.length; i++){
      if(storageItems[i].Product != null){
        if(storageItems[i].Product!.id != null){
        _items.putIfAbsent(storageItems[i].Product!.id!, () => storageItems[i]);
        }
      }
    }
  }
}
