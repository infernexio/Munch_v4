class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  List<ProductModel>? _products;

  Product(
      {required int totalSize,required int typeId,required int offset,required List<ProductModel> products}) {
    if (totalSize != null) {
      this._totalSize = totalSize;
    }
    if (typeId != null) {
      this._typeId = typeId;
    }
    if (offset != null) {
      this._offset = offset;
    }
    if (products != null) {
      this._products = products;
    }
  }

  int? get totalSize => _totalSize;
  set totalSize(int? totalSize) => _totalSize = totalSize;
  int? get typeId => _typeId;
  set typeId(int? typeId) => _typeId = typeId;
  int? get offset => _offset;
  set offset(int? offset) => _offset = offset;
  List<ProductModel>? get products => _products;
  set products(List<ProductModel>? products) => _products = products;

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        _products!.add(new ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  int? _id;
  String? _name;
  String? _description;
  int? _price;
  int? _stars;
  String? _img;
  String? _location;
  String? _createdAt;
  String? _updatedAt;
  int? _typeId;

  ProductModel(
      {int? id,
      String? name,
      String? description,
      int? price,
      int? stars,
      String? img,
      String? location,
      String? createdAt,
      String? updatedAt,
      int? typeId}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (price != null) {
      this._price = price;
    }
    if (stars != null) {
      this._stars = stars;
    }
    if (img != null) {
      this._img = img;
    }
    if (location != null) {
      this._location = location;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (typeId != null) {
      this._typeId = typeId;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  int? get price => _price;
  set price(int? price) => _price = price;
  int? get stars => _stars;
  set stars(int? stars) => _stars = stars;
  String? get img => _img;
  set img(String? img) => _img = img;
  String? get location => _location;
  set location(String? location) => _location = location;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get typeId => _typeId;
  set typeId(int? typeId) => _typeId = typeId;

  ProductModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _stars = json['stars'];
    _img = json['img'];
    _location = json['location'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _typeId = json['type_id'];
  }

  void add(ProductModel productModel) {}
}