import 'package:munch_v4/models/products_models.dart';

class IngredientsModel {
  int? _id;
  String? _name;
  int? _price;
  String? _img;
  int? _quantity;
  bool? _isExist;
  String? _time;
  ProductModel? _products;


  IngredientsModel(
      {int? id,
      String? name,
      int? price,
      String? img,
      int? quantity,
      bool? isExist,
      String? time,
      ProductModel? products}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (price != null) {
      this._price = price;
    }
    if (img != null) {
      this._img = img;
    }
    if (quantity != null){
      this._quantity = quantity;
    }
    if(isExist != null){
      this._isExist = isExist;
    }
    if(time != null){
      this._time = time;
    }
      this._products = products;
  }

  int? get id => _id;
  get quantity => _quantity;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get price => _price;
  set price(int? price) => _price = price;
  String? get img => _img;
  set img(String? img) => _img = img;
  String? get time => _time;
  set time(String? time) => _time = time;
  ProductModel? get Product =>_products;
  set Product(ProductModel? product) => _products = product;


  IngredientsModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
    _img = json['img'];
    _quantity = json['quantity'];
    _isExist = json['isExist'];
    _time = json['time'];
    if(json['products'] != null){
      _products = <ProductModel>[] as ProductModel?;
      json['products'].forEach((v){
        _products!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    return{
      "id":this._id,
      "name":this._name,
      "price":this._price,
      "img":this._img,
      "quantity":this._quantity,
      "exist":this._isExist,
      "time":this.time,
    };
  }
}