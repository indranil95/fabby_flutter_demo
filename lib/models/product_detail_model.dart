import 'package:flutter_fabby_demo/models/cart_data_model.dart';

class ProductDetailModel {
  ProductDetailModel({
      Data? data,
      bool? success,
      num? error,
      String? statusCode,}){
    _data = data;
    _success = success;
    _error = error;
    _statusCode = statusCode;
}

  ProductDetailModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _error = json['error'];
    _statusCode = json['status_code'];
  }
  Data? _data;
  bool? _success;
  num? _error;
  String? _statusCode;
ProductDetailModel copyWith({  Data? data,
  bool? success,
  num? error,
  String? statusCode,
}) => ProductDetailModel(  data: data ?? _data,
  success: success ?? _success,
  error: error ?? _error,
  statusCode: statusCode ?? _statusCode,
);
  Data? get data => _data;
  bool? get success => _success;
  num? get error => _error;
  String? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['success'] = _success;
    map['error'] = _error;
    map['status_code'] = _statusCode;
    return map;
  }

}

class Data {
  Data({
      bool? wishlist,
      List<SimilarProducts>? similarProducts,
      List<Products>? products,
      List<ProductDescription>? productDescription,
      List<RelatedProducts>? relatedProducts,}){
    _wishlist = wishlist;
    _similarProducts = similarProducts;
    _products = products;
    _productDescription = productDescription;
    _relatedProducts = relatedProducts;
}

  Data.fromJson(dynamic json) {
    _wishlist = json['wishlist'];
    if (json['similar_products'] != null) {
      _similarProducts = [];
      json['similar_products'].forEach((v) {
        _similarProducts?.add(SimilarProducts.fromJson(v));
      });
    }
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    if (json['product_description'] != null) {
      _productDescription = [];
      json['product_description'].forEach((v) {
        _productDescription?.add(ProductDescription.fromJson(v));
      });
    }
    if (json['relatedProducts'] != null) {
      _relatedProducts = [];
      json['relatedProducts'].forEach((v) {
        _relatedProducts?.add(RelatedProducts.fromJson(v));
      });
    }
  }
  bool? _wishlist;
  List<SimilarProducts>? _similarProducts;
  List<Products>? _products;
  List<ProductDescription>? _productDescription;
  List<RelatedProducts>? _relatedProducts;
Data copyWith({  bool? wishlist,
  List<SimilarProducts>? similarProducts,
  List<Products>? products,
  List<ProductDescription>? productDescription,
  List<RelatedProducts>? relatedProducts,
}) => Data(  wishlist: wishlist ?? _wishlist,
  similarProducts: similarProducts ?? _similarProducts,
  products: products ?? _products,
  productDescription: productDescription ?? _productDescription,
  relatedProducts: relatedProducts ?? _relatedProducts,
);
  bool? get wishlist => _wishlist;
  List<SimilarProducts>? get similarProducts => _similarProducts;
  List<Products>? get products => _products;
  List<ProductDescription>? get productDescription => _productDescription;
  List<RelatedProducts>? get relatedProducts => _relatedProducts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wishlist'] = _wishlist;
    if (_similarProducts != null) {
      map['similar_products'] = _similarProducts?.map((v) => v.toJson()).toList();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    if (_productDescription != null) {
      map['product_description'] = _productDescription?.map((v) => v.toJson()).toList();
    }
    if (_relatedProducts != null) {
      map['relatedProducts'] = _relatedProducts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class RelatedProducts {
  RelatedProducts({
      num? id,
      String? productName,
      String? price,
      String? productImage,
      dynamic offers,}){
    _id = id;
    _productName = productName;
    _price = price;
    _productImage = productImage;
    _offers = offers;
}

  RelatedProducts.fromJson(dynamic json) {
    _id = json['id'];
    _productName = json['product_name'];
    _price = json['price'];
    _productImage = json['product_image'];
    _offers = json['offers'];
  }
  num? _id;
  String? _productName;
  String? _price;
  String? _productImage;
  dynamic _offers;
RelatedProducts copyWith({  num? id,
  String? productName,
  String? price,
  String? productImage,
  dynamic offers,
}) => RelatedProducts(  id: id ?? _id,
  productName: productName ?? _productName,
  price: price ?? _price,
  productImage: productImage ?? _productImage,
  offers: offers ?? _offers,
);
  num? get id => _id;
  String? get productName => _productName;
  String? get price => _price;
  String? get productImage => _productImage;
  dynamic get offers => _offers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_name'] = _productName;
    map['price'] = _price;
    map['product_image'] = _productImage;
    map['offers'] = _offers;
    return map;
  }

}

class ProductDescription {
  ProductDescription({
      num? id,
      num? productId,
      String? title,
      String? description,}){
    _id = id;
    _productId = productId;
    _title = title;
    _description = description;
}

  ProductDescription.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _title = json['title'];
    _description = json['description'];
  }
  num? _id;
  num? _productId;
  String? _title;
  String? _description;
ProductDescription copyWith({  num? id,
  num? productId,
  String? title,
  String? description,
}) => ProductDescription(  id: id ?? _id,
  productId: productId ?? _productId,
  title: title ?? _title,
  description: description ?? _description,
);
  num? get id => _id;
  num? get productId => _productId;
  String? get title => _title;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }

}


class Products {
  Products({
      num? id,
      String? productName,
      String? slug,
      String? meteTitle,
      String? metaDescription,
      String? productId,
      num? quantity,
      String? price,
      String? barcode,
      dynamic countryOfOrigin,
      dynamic vatRate,
      dynamic brandName,
      num? categoryId,
      num? subCategoryId,
      dynamic unit,
      String? manufacturedBy,
      dynamic description,
      dynamic benefits,
      dynamic activeIngredients,
      String? productImage,
      String? productImgStatus,
      dynamic longDescription,
      dynamic howToUse,
      String? whatIncluded,
      String? amazonLink,
      num? height,
      num? width,
      num? length,
      num? weight,
      dynamic type,
      num? status,
      List<ProductImageArr>? productImageArr,
      dynamic offers,
      Categories? categories,
      SubCategory? subCategory,
      List<Store>? store,
      List<ProductTag>? productTag,}){
    _id = id;
    _productName = productName;
    _slug = slug;
    _meteTitle = meteTitle;
    _metaDescription = metaDescription;
    _productId = productId;
    _quantity = quantity;
    _price = price;
    _barcode = barcode;
    _countryOfOrigin = countryOfOrigin;
    _vatRate = vatRate;
    _brandName = brandName;
    _categoryId = categoryId;
    _subCategoryId = subCategoryId;
    _unit = unit;
    _manufacturedBy = manufacturedBy;
    _description = description;
    _benefits = benefits;
    _activeIngredients = activeIngredients;
    _productImage = productImage;
    _productImgStatus = productImgStatus;
    _longDescription = longDescription;
    _howToUse = howToUse;
    _whatIncluded = whatIncluded;
    _amazonLink = amazonLink;
    _height = height;
    _width = width;
    _length = length;
    _weight = weight;
    _type = type;
    _status = status;
    _productImageArr = productImageArr;
    _offers = offers;
    _categories = categories;
    _subCategory = subCategory;
    _store = store;
    _productTag = productTag;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _productName = json['product_name'];
    _slug = json['slug'];
    _meteTitle = json['mete_title'];
    _metaDescription = json['meta_description'];
    _productId = json['productId'];
    _quantity = json['quantity'];
    _price = json['price'];
    _barcode = json['barcode'];
    _countryOfOrigin = json['country_of_origin'];
    _vatRate = json['vat_rate'];
    _brandName = json['brand_name'];
    _categoryId = json['category_id'];
    _subCategoryId = json['sub_category_id'];
    _unit = json['unit'];
    _manufacturedBy = json['manufactured_by'];
    _description = json['description'];
    _benefits = json['benefits'];
    _activeIngredients = json['active_ingredients'];
    _productImage = json['product_image'];
    _productImgStatus = json['product_img_status'];
    _longDescription = json['long_description'];
    _howToUse = json['how_to_use'];
    _whatIncluded = json['what_included'];
    _amazonLink = json['amazon_link'];
    _height = json['height'];
    _width = json['width'];
    _length = json['length'];
    _weight = json['weight'];
    _type = json['type'];
    _status = json['status'];
    if (json['product_image_arr'] != null) {
      _productImageArr = [];
      json['product_image_arr'].forEach((v) {
        _productImageArr?.add(ProductImageArr.fromJson(v));
      });
    }
    if (json['product_tag'] != null) {
      _productTag = (json['product_tag'] as List)
          .map((tagJson) => ProductTag.fromJson(tagJson as Map<String, dynamic>))
          .toList();
    }
    _offers = json['offers'];
    _categories = json['categories'] != null ? Categories.fromJson(json['categories']) : null;
    _subCategory = json['sub_category'] != null ? SubCategory.fromJson(json['sub_category']) : null;
    if (json['store'] != null) {
      _store = [];
      json['store'].forEach((v) {
        _store?.add(Store.fromJson(v));
      });
    }
    if (json['product_tag'] != null) {
      _productTag = [];
      json['product_tag'].forEach((v) {
        _productTag?.add(ProductTag.fromJson(v));
      });
    }
  }
  num? _id;
  String? _productName;
  String? _slug;
  String? _meteTitle;
  String? _metaDescription;
  String? _productId;
  num? _quantity;
  String? _price;
  String? _barcode;
  dynamic _countryOfOrigin;
  dynamic _vatRate;
  dynamic _brandName;
  num? _categoryId;
  num? _subCategoryId;
  dynamic _unit;
  String? _manufacturedBy;
  dynamic _description;
  dynamic _benefits;
  dynamic _activeIngredients;
  String? _productImage;
  String? _productImgStatus;
  dynamic _longDescription;
  dynamic _howToUse;
  String? _whatIncluded;
  String? _amazonLink;
  num? _height;
  num? _width;
  num? _length;
  num? _weight;
  dynamic _type;
  num? _status;
  List<ProductImageArr>? _productImageArr;
  dynamic _offers;
  Categories? _categories;
  SubCategory? _subCategory;
  List<Store>? _store;
  List<ProductTag>? _productTag;
Products copyWith({  num? id,
  String? productName,
  String? slug,
  String? meteTitle,
  String? metaDescription,
  String? productId,
  num? quantity,
  String? price,
  String? barcode,
  dynamic countryOfOrigin,
  dynamic vatRate,
  dynamic brandName,
  num? categoryId,
  num? subCategoryId,
  dynamic unit,
  String? manufacturedBy,
  dynamic description,
  dynamic benefits,
  dynamic activeIngredients,
  String? productImage,
  String? productImgStatus,
  dynamic longDescription,
  dynamic howToUse,
  String? whatIncluded,
  String? amazonLink,
  num? height,
  num? width,
  num? length,
  num? weight,
  dynamic type,
  num? status,
  List<ProductImageArr>? productImageArr,
  dynamic offers,
  Categories? categories,
  SubCategory? subCategory,
  List<Store>? store,
  List<ProductTag>? productTag,
}) => Products(  id: id ?? _id,
  productName: productName ?? _productName,
  slug: slug ?? _slug,
  meteTitle: meteTitle ?? _meteTitle,
  metaDescription: metaDescription ?? _metaDescription,
  productId: productId ?? _productId,
  quantity: quantity ?? _quantity,
  price: price ?? _price,
  barcode: barcode ?? _barcode,
  countryOfOrigin: countryOfOrigin ?? _countryOfOrigin,
  vatRate: vatRate ?? _vatRate,
  brandName: brandName ?? _brandName,
  categoryId: categoryId ?? _categoryId,
  subCategoryId: subCategoryId ?? _subCategoryId,
  unit: unit ?? _unit,
  manufacturedBy: manufacturedBy ?? _manufacturedBy,
  description: description ?? _description,
  benefits: benefits ?? _benefits,
  activeIngredients: activeIngredients ?? _activeIngredients,
  productImage: productImage ?? _productImage,
  productImgStatus: productImgStatus ?? _productImgStatus,
  longDescription: longDescription ?? _longDescription,
  howToUse: howToUse ?? _howToUse,
  whatIncluded: whatIncluded ?? _whatIncluded,
  amazonLink: amazonLink ?? _amazonLink,
  height: height ?? _height,
  width: width ?? _width,
  length: length ?? _length,
  weight: weight ?? _weight,
  type: type ?? _type,
  status: status ?? _status,
  productImageArr: productImageArr ?? _productImageArr,
  offers: offers ?? _offers,
  categories: categories ?? _categories,
  subCategory: subCategory ?? _subCategory,
  store: store ?? _store,
  productTag: productTag ?? _productTag,
);
  num? get id => _id;
  String? get productName => _productName;
  String? get slug => _slug;
  String? get meteTitle => _meteTitle;
  String? get metaDescription => _metaDescription;
  String? get productId => _productId;
  num? get quantity => _quantity;
  String? get price => _price;
  String? get barcode => _barcode;
  dynamic get countryOfOrigin => _countryOfOrigin;
  dynamic get vatRate => _vatRate;
  dynamic get brandName => _brandName;
  num? get categoryId => _categoryId;
  num? get subCategoryId => _subCategoryId;
  dynamic get unit => _unit;
  String? get manufacturedBy => _manufacturedBy;
  dynamic get description => _description;
  dynamic get benefits => _benefits;
  dynamic get activeIngredients => _activeIngredients;
  String? get productImage => _productImage;
  String? get productImgStatus => _productImgStatus;
  dynamic get longDescription => _longDescription;
  dynamic get howToUse => _howToUse;
  String? get whatIncluded => _whatIncluded;
  String? get amazonLink => _amazonLink;
  num? get height => _height;
  num? get width => _width;
  num? get length => _length;
  num? get weight => _weight;
  dynamic get type => _type;
  num? get status => _status;
  List<ProductImageArr>? get productImageArr => _productImageArr;
  dynamic get offers => _offers;
  Categories? get categories => _categories;
  SubCategory? get subCategory => _subCategory;
  List<Store>? get store => _store;
  List<dynamic>? get productTag => _productTag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_name'] = _productName;
    map['slug'] = _slug;
    map['mete_title'] = _meteTitle;
    map['meta_description'] = _metaDescription;
    map['productId'] = _productId;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['barcode'] = _barcode;
    map['country_of_origin'] = _countryOfOrigin;
    map['vat_rate'] = _vatRate;
    map['brand_name'] = _brandName;
    map['category_id'] = _categoryId;
    map['sub_category_id'] = _subCategoryId;
    map['unit'] = _unit;
    map['manufactured_by'] = _manufacturedBy;
    map['description'] = _description;
    map['benefits'] = _benefits;
    map['active_ingredients'] = _activeIngredients;
    map['product_image'] = _productImage;
    map['product_img_status'] = _productImgStatus;
    map['long_description'] = _longDescription;
    map['how_to_use'] = _howToUse;
    map['what_included'] = _whatIncluded;
    map['amazon_link'] = _amazonLink;
    map['height'] = _height;
    map['width'] = _width;
    map['length'] = _length;
    map['weight'] = _weight;
    map['type'] = _type;
    map['status'] = _status;
    if (_productImageArr != null) {
      map['product_image_arr'] = _productImageArr?.map((v) => v.toJson()).toList();
    }
    map['offers'] = _offers;
    if (_categories != null) {
      map['categories'] = _categories?.toJson();
    }
    if (_subCategory != null) {
      map['sub_category'] = _subCategory?.toJson();
    }
    if (_store != null) {
      map['store'] = _store?.map((v) => v.toJson()).toList();
    }
    if (_productTag != null) {
      map['product_tag'] = _productTag?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
class ProductTag {
  int? id;
  String? tagName;
  PivotM? pivot;  // Change Pivot to PivotM

  ProductTag({this.id, this.tagName, this.pivot});

  factory ProductTag.fromJson(Map<String, dynamic> json) {
    return ProductTag(
      id: json['id'],
      tagName: json['tag_name'],
      pivot: json['pivot'] != null ? PivotM.fromJson(json['pivot']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tag_name'] = tagName;
    if (pivot != null) {
      data['pivot'] = pivot?.toJson();
    }
    return data;
  }
}


class PivotM {
  int? productId;
  int? productTagId;

  PivotM({this.productId, this.productTagId});

  // Factory constructor for creating a new `Pivot` instance from JSON
  factory PivotM.fromJson(Map<String, dynamic> json) {
    return PivotM(
      productId: json['product_id'],
      productTagId: json['product_tag_id'],
    );
  }

  // Method for converting a `Pivot` instance to a JSON map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_tag_id'] = productTagId;
    return data;
  }
}

class Store {
  Store({
      num? id,
      String? storeName,
      String? lat,
      String? lng,
      String? address,
      String? storeContact,
      String? storeEmail,
      String? storeWorkingHours,
      num? orderSlotThreshold,
      Pivot? pivot,}){
    _id = id;
    _storeName = storeName;
    _lat = lat;
    _lng = lng;
    _address = address;
    _storeContact = storeContact;
    _storeEmail = storeEmail;
    _storeWorkingHours = storeWorkingHours;
    _orderSlotThreshold = orderSlotThreshold;
    _pivot = pivot;
}

  Store.fromJson(dynamic json) {
    _id = json['id'];
    _storeName = json['store_name'];
    _lat = json['lat'];
    _lng = json['lng'];
    _address = json['address'];
    _storeContact = json['store_contact'];
    _storeEmail = json['store_email'];
    _storeWorkingHours = json['store_working_hours'];
    _orderSlotThreshold = json['order_slot_threshold'];
    _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  num? _id;
  String? _storeName;
  String? _lat;
  String? _lng;
  String? _address;
  String? _storeContact;
  String? _storeEmail;
  String? _storeWorkingHours;
  num? _orderSlotThreshold;
  Pivot? _pivot;
Store copyWith({  num? id,
  String? storeName,
  String? lat,
  String? lng,
  String? address,
  String? storeContact,
  String? storeEmail,
  String? storeWorkingHours,
  num? orderSlotThreshold,
  Pivot? pivot,
}) => Store(  id: id ?? _id,
  storeName: storeName ?? _storeName,
  lat: lat ?? _lat,
  lng: lng ?? _lng,
  address: address ?? _address,
  storeContact: storeContact ?? _storeContact,
  storeEmail: storeEmail ?? _storeEmail,
  storeWorkingHours: storeWorkingHours ?? _storeWorkingHours,
  orderSlotThreshold: orderSlotThreshold ?? _orderSlotThreshold,
  pivot: pivot ?? _pivot,
);
  num? get id => _id;
  String? get storeName => _storeName;
  String? get lat => _lat;
  String? get lng => _lng;
  String? get address => _address;
  String? get storeContact => _storeContact;
  String? get storeEmail => _storeEmail;
  String? get storeWorkingHours => _storeWorkingHours;
  num? get orderSlotThreshold => _orderSlotThreshold;
  Pivot? get pivot => _pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['store_name'] = _storeName;
    map['lat'] = _lat;
    map['lng'] = _lng;
    map['address'] = _address;
    map['store_contact'] = _storeContact;
    map['store_email'] = _storeEmail;
    map['store_working_hours'] = _storeWorkingHours;
    map['order_slot_threshold'] = _orderSlotThreshold;
    if (_pivot != null) {
      map['pivot'] = _pivot?.toJson();
    }
    return map;
  }

}

class Pivot {
  Pivot({
      num? productId,
      num? storeId,
      num? productQuantity,
      String? createdAt,
      String? updatedAt,}){
    _productId = productId;
    _storeId = storeId;
    _productQuantity = productQuantity;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Pivot.fromJson(dynamic json) {
    _productId = json['product_id'];
    _storeId = json['store_id'];
    _productQuantity = json['product_quantity'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _productId;
  num? _storeId;
  num? _productQuantity;
  String? _createdAt;
  String? _updatedAt;
Pivot copyWith({  num? productId,
  num? storeId,
  num? productQuantity,
  String? createdAt,
  String? updatedAt,
}) => Pivot(  productId: productId ?? _productId,
  storeId: storeId ?? _storeId,
  productQuantity: productQuantity ?? _productQuantity,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get productId => _productId;
  num? get storeId => _storeId;
  num? get productQuantity => _productQuantity;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['store_id'] = _storeId;
    map['product_quantity'] = _productQuantity;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class SubCategory {
  SubCategory({
      num? id,
      String? subcategoryName,}){
    _id = id;
    _subcategoryName = subcategoryName;
}

  SubCategory.fromJson(dynamic json) {
    _id = json['id'];
    _subcategoryName = json['subcategory_name'];
  }
  num? _id;
  String? _subcategoryName;
SubCategory copyWith({  num? id,
  String? subcategoryName,
}) => SubCategory(  id: id ?? _id,
  subcategoryName: subcategoryName ?? _subcategoryName,
);
  num? get id => _id;
  String? get subcategoryName => _subcategoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['subcategory_name'] = _subcategoryName;
    return map;
  }

}


class Categories {
  Categories({
      num? id,
      String? categoriesName,}){
    _id = id;
    _categoriesName = categoriesName;
}

  Categories.fromJson(dynamic json) {
    _id = json['id'];
    _categoriesName = json['categories_name'];
  }
  num? _id;
  String? _categoriesName;
Categories copyWith({  num? id,
  String? categoriesName,
}) => Categories(  id: id ?? _id,
  categoriesName: categoriesName ?? _categoriesName,
);
  num? get id => _id;
  String? get categoriesName => _categoriesName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['categories_name'] = _categoriesName;
    return map;
  }

}

class ProductImageArr {
  ProductImageArr({
      num? id,
      num? productId,
      String? image,
      num? featuredImage,}){
    _id = id;
    _productId = productId;
    _image = image;
    _featuredImage = featuredImage;
}

  ProductImageArr.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _image = json['image'];
    _featuredImage = json['featured_image'];
  }
  num? _id;
  num? _productId;
  String? _image;
  num? _featuredImage;
ProductImageArr copyWith({  num? id,
  num? productId,
  String? image,
  num? featuredImage,
}) => ProductImageArr(  id: id ?? _id,
  productId: productId ?? _productId,
  image: image ?? _image,
  featuredImage: featuredImage ?? _featuredImage,
);
  num? get id => _id;
  num? get productId => _productId;
  String? get image => _image;
  num? get featuredImage => _featuredImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['image'] = _image;
    map['featured_image'] = _featuredImage;
    return map;
  }

}

class SimilarProducts {
  SimilarProducts({
      num? id,
      String? productName,
      String? slug,
      String? meteTitle,
      String? metaDescription,
      String? productId,
      num? quantity,
      String? price,
      String? barcode,
      dynamic countryOfOrigin,
      dynamic vatRate,
      dynamic brandName,
      dynamic categoryId,
      dynamic subCategoryId,
      dynamic unit,
      String? manufacturedBy,
      dynamic description,
      dynamic benefits,
      dynamic activeIngredients,
      String? productImage,
      String? productImgStatus,
      dynamic longDescription,
      dynamic howToUse,
      String? whatIncluded,
      dynamic amazonLink,
      num? height,
      num? width,
      num? length,
      num? weight,
      dynamic type,
      num? status,
      List<ProductImageArr>? productImageArr,
      dynamic offers,
      dynamic categories,
      dynamic subCategory,
      List<Store>? store,}){
    _id = id;
    _productName = productName;
    _slug = slug;
    _meteTitle = meteTitle;
    _metaDescription = metaDescription;
    _productId = productId;
    _quantity = quantity;
    _price = price;
    _barcode = barcode;
    _countryOfOrigin = countryOfOrigin;
    _vatRate = vatRate;
    _brandName = brandName;
    _categoryId = categoryId;
    _subCategoryId = subCategoryId;
    _unit = unit;
    _manufacturedBy = manufacturedBy;
    _description = description;
    _benefits = benefits;
    _activeIngredients = activeIngredients;
    _productImage = productImage;
    _productImgStatus = productImgStatus;
    _longDescription = longDescription;
    _howToUse = howToUse;
    _whatIncluded = whatIncluded;
    _amazonLink = amazonLink;
    _height = height;
    _width = width;
    _length = length;
    _weight = weight;
    _type = type;
    _status = status;
    _productImageArr = productImageArr;
    _offers = offers;
    _categories = categories;
    _subCategory = subCategory;
    _store = store;
}

  SimilarProducts.fromJson(dynamic json) {
    _id = json['id'];
    _productName = json['product_name'];
    _slug = json['slug'];
    _meteTitle = json['mete_title'];
    _metaDescription = json['meta_description'];
    _productId = json['productId'];
    _quantity = json['quantity'];
    _price = json['price'];
    _barcode = json['barcode'];
    _countryOfOrigin = json['country_of_origin'];
    _vatRate = json['vat_rate'];
    _brandName = json['brand_name'];
    _categoryId = json['category_id'];
    _subCategoryId = json['sub_category_id'];
    _unit = json['unit'];
    _manufacturedBy = json['manufactured_by'];
    _description = json['description'];
    _benefits = json['benefits'];
    _activeIngredients = json['active_ingredients'];
    _productImage = json['product_image'];
    _productImgStatus = json['product_img_status'];
    _longDescription = json['long_description'];
    _howToUse = json['how_to_use'];
    _whatIncluded = json['what_included'];
    _amazonLink = json['amazon_link'];
    _height = json['height'];
    _width = json['width'];
    _length = json['length'];
    _weight = json['weight'];
    _type = json['type'];
    _status = json['status'];
    if (json['product_image_arr'] != null) {
      _productImageArr = [];
      json['product_image_arr'].forEach((v) {
        _productImageArr?.add(ProductImageArr.fromJson(v));
      });
    }
    _offers = json['offers'];
    _categories = json['categories'];
    _subCategory = json['sub_category'];
    if (json['store'] != null) {
      _store = [];
      json['store'].forEach((v) {
        _store?.add(Store.fromJson(v));
      });
    }
  }
  num? _id;
  String? _productName;
  String? _slug;
  String? _meteTitle;
  String? _metaDescription;
  String? _productId;
  num? _quantity;
  String? _price;
  String? _barcode;
  dynamic _countryOfOrigin;
  dynamic _vatRate;
  dynamic _brandName;
  dynamic _categoryId;
  dynamic _subCategoryId;
  dynamic _unit;
  String? _manufacturedBy;
  dynamic _description;
  dynamic _benefits;
  dynamic _activeIngredients;
  String? _productImage;
  String? _productImgStatus;
  dynamic _longDescription;
  dynamic _howToUse;
  String? _whatIncluded;
  dynamic _amazonLink;
  num? _height;
  num? _width;
  num? _length;
  num? _weight;
  dynamic _type;
  num? _status;
  List<ProductImageArr>? _productImageArr;
  dynamic _offers;
  dynamic _categories;
  dynamic _subCategory;
  List<Store>? _store;
SimilarProducts copyWith({  num? id,
  String? productName,
  String? slug,
  String? meteTitle,
  String? metaDescription,
  String? productId,
  num? quantity,
  String? price,
  String? barcode,
  dynamic countryOfOrigin,
  dynamic vatRate,
  dynamic brandName,
  dynamic categoryId,
  dynamic subCategoryId,
  dynamic unit,
  String? manufacturedBy,
  dynamic description,
  dynamic benefits,
  dynamic activeIngredients,
  String? productImage,
  String? productImgStatus,
  dynamic longDescription,
  dynamic howToUse,
  String? whatIncluded,
  dynamic amazonLink,
  num? height,
  num? width,
  num? length,
  num? weight,
  dynamic type,
  num? status,
  List<ProductImageArr>? productImageArr,
  dynamic offers,
  dynamic categories,
  dynamic subCategory,
  List<Store>? store,
}) => SimilarProducts(  id: id ?? _id,
  productName: productName ?? _productName,
  slug: slug ?? _slug,
  meteTitle: meteTitle ?? _meteTitle,
  metaDescription: metaDescription ?? _metaDescription,
  productId: productId ?? _productId,
  quantity: quantity ?? _quantity,
  price: price ?? _price,
  barcode: barcode ?? _barcode,
  countryOfOrigin: countryOfOrigin ?? _countryOfOrigin,
  vatRate: vatRate ?? _vatRate,
  brandName: brandName ?? _brandName,
  categoryId: categoryId ?? _categoryId,
  subCategoryId: subCategoryId ?? _subCategoryId,
  unit: unit ?? _unit,
  manufacturedBy: manufacturedBy ?? _manufacturedBy,
  description: description ?? _description,
  benefits: benefits ?? _benefits,
  activeIngredients: activeIngredients ?? _activeIngredients,
  productImage: productImage ?? _productImage,
  productImgStatus: productImgStatus ?? _productImgStatus,
  longDescription: longDescription ?? _longDescription,
  howToUse: howToUse ?? _howToUse,
  whatIncluded: whatIncluded ?? _whatIncluded,
  amazonLink: amazonLink ?? _amazonLink,
  height: height ?? _height,
  width: width ?? _width,
  length: length ?? _length,
  weight: weight ?? _weight,
  type: type ?? _type,
  status: status ?? _status,
  productImageArr: productImageArr ?? _productImageArr,
  offers: offers ?? _offers,
  categories: categories ?? _categories,
  subCategory: subCategory ?? _subCategory,
  store: store ?? _store,
);
  num? get id => _id;
  String? get productName => _productName;
  String? get slug => _slug;
  String? get meteTitle => _meteTitle;
  String? get metaDescription => _metaDescription;
  String? get productId => _productId;
  num? get quantity => _quantity;
  String? get price => _price;
  String? get barcode => _barcode;
  dynamic get countryOfOrigin => _countryOfOrigin;
  dynamic get vatRate => _vatRate;
  dynamic get brandName => _brandName;
  dynamic get categoryId => _categoryId;
  dynamic get subCategoryId => _subCategoryId;
  dynamic get unit => _unit;
  String? get manufacturedBy => _manufacturedBy;
  dynamic get description => _description;
  dynamic get benefits => _benefits;
  dynamic get activeIngredients => _activeIngredients;
  String? get productImage => _productImage;
  String? get productImgStatus => _productImgStatus;
  dynamic get longDescription => _longDescription;
  dynamic get howToUse => _howToUse;
  String? get whatIncluded => _whatIncluded;
  dynamic get amazonLink => _amazonLink;
  num? get height => _height;
  num? get width => _width;
  num? get length => _length;
  num? get weight => _weight;
  dynamic get type => _type;
  num? get status => _status;
  List<ProductImageArr>? get productImageArr => _productImageArr;
  dynamic get offers => _offers;
  dynamic get categories => _categories;
  dynamic get subCategory => _subCategory;
  List<Store>? get store => _store;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_name'] = _productName;
    map['slug'] = _slug;
    map['mete_title'] = _meteTitle;
    map['meta_description'] = _metaDescription;
    map['productId'] = _productId;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['barcode'] = _barcode;
    map['country_of_origin'] = _countryOfOrigin;
    map['vat_rate'] = _vatRate;
    map['brand_name'] = _brandName;
    map['category_id'] = _categoryId;
    map['sub_category_id'] = _subCategoryId;
    map['unit'] = _unit;
    map['manufactured_by'] = _manufacturedBy;
    map['description'] = _description;
    map['benefits'] = _benefits;
    map['active_ingredients'] = _activeIngredients;
    map['product_image'] = _productImage;
    map['product_img_status'] = _productImgStatus;
    map['long_description'] = _longDescription;
    map['how_to_use'] = _howToUse;
    map['what_included'] = _whatIncluded;
    map['amazon_link'] = _amazonLink;
    map['height'] = _height;
    map['width'] = _width;
    map['length'] = _length;
    map['weight'] = _weight;
    map['type'] = _type;
    map['status'] = _status;
    if (_productImageArr != null) {
      map['product_image_arr'] = _productImageArr?.map((v) => v.toJson()).toList();
    }
    map['offers'] = _offers;
    map['categories'] = _categories;
    map['sub_category'] = _subCategory;
    if (_store != null) {
      map['store'] = _store?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class StoreNew {
  StoreNew({
      num? id,
      String? storeName,
      String? lat,
      String? lng,
      String? address,
      String? storeContact,
      String? storeEmail,
      String? storeWorkingHours,
      num? orderSlotThreshold,
      Pivot? pivot,}){
    _id = id;
    _storeName = storeName;
    _lat = lat;
    _lng = lng;
    _address = address;
    _storeContact = storeContact;
    _storeEmail = storeEmail;
    _storeWorkingHours = storeWorkingHours;
    _orderSlotThreshold = orderSlotThreshold;
    _pivot = pivot;
}

  StoreNew.fromJson(dynamic json) {
    _id = json['id'];
    _storeName = json['store_name'];
    _lat = json['lat'];
    _lng = json['lng'];
    _address = json['address'];
    _storeContact = json['store_contact'];
    _storeEmail = json['store_email'];
    _storeWorkingHours = json['store_working_hours'];
    _orderSlotThreshold = json['order_slot_threshold'];
    _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  num? _id;
  String? _storeName;
  String? _lat;
  String? _lng;
  String? _address;
  String? _storeContact;
  String? _storeEmail;
  String? _storeWorkingHours;
  num? _orderSlotThreshold;
  Pivot? _pivot;
Store copyWith({  num? id,
  String? storeName,
  String? lat,
  String? lng,
  String? address,
  String? storeContact,
  String? storeEmail,
  String? storeWorkingHours,
  num? orderSlotThreshold,
  Pivot? pivot,
}) => Store(  id: id ?? _id,
  storeName: storeName ?? _storeName,
  lat: lat ?? _lat,
  lng: lng ?? _lng,
  address: address ?? _address,
  storeContact: storeContact ?? _storeContact,
  storeEmail: storeEmail ?? _storeEmail,
  storeWorkingHours: storeWorkingHours ?? _storeWorkingHours,
  orderSlotThreshold: orderSlotThreshold ?? _orderSlotThreshold,
  pivot: pivot ?? _pivot,
);
  num? get id => _id;
  String? get storeName => _storeName;
  String? get lat => _lat;
  String? get lng => _lng;
  String? get address => _address;
  String? get storeContact => _storeContact;
  String? get storeEmail => _storeEmail;
  String? get storeWorkingHours => _storeWorkingHours;
  num? get orderSlotThreshold => _orderSlotThreshold;
  Pivot? get pivot => _pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['store_name'] = _storeName;
    map['lat'] = _lat;
    map['lng'] = _lng;
    map['address'] = _address;
    map['store_contact'] = _storeContact;
    map['store_email'] = _storeEmail;
    map['store_working_hours'] = _storeWorkingHours;
    map['order_slot_threshold'] = _orderSlotThreshold;
    if (_pivot != null) {
      map['pivot'] = _pivot?.toJson();
    }
    return map;
  }

}


class PivotNew {
  PivotNew({
      num? productId,
      num? storeId,
      num? productQuantity,
      String? createdAt,
      String? updatedAt,}){
    _productId = productId;
    _storeId = storeId;
    _productQuantity = productQuantity;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  PivotNew.fromJson(dynamic json) {
    _productId = json['product_id'];
    _storeId = json['store_id'];
    _productQuantity = json['product_quantity'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _productId;
  num? _storeId;
  num? _productQuantity;
  String? _createdAt;
  String? _updatedAt;
Pivot copyWith({  num? productId,
  num? storeId,
  num? productQuantity,
  String? createdAt,
  String? updatedAt,
}) => Pivot(  productId: productId ?? _productId,
  storeId: storeId ?? _storeId,
  productQuantity: productQuantity ?? _productQuantity,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get productId => _productId;
  num? get storeId => _storeId;
  num? get productQuantity => _productQuantity;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['store_id'] = _storeId;
    map['product_quantity'] = _productQuantity;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class ProductImageArrNew {
  ProductImageArrNew({
      num? id,
      num? productId,
      String? image,
      num? featuredImage,}){
    _id = id;
    _productId = productId;
    _image = image;
    _featuredImage = featuredImage;
}

  ProductImageArrNew.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _image = json['image'];
    _featuredImage = json['featured_image'];
  }
  num? _id;
  num? _productId;
  String? _image;
  num? _featuredImage;
ProductImageArr copyWith({  num? id,
  num? productId,
  String? image,
  num? featuredImage,
}) => ProductImageArr(  id: id ?? _id,
  productId: productId ?? _productId,
  image: image ?? _image,
  featuredImage: featuredImage ?? _featuredImage,
);
  num? get id => _id;
  num? get productId => _productId;
  String? get image => _image;
  num? get featuredImage => _featuredImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['image'] = _image;
    map['featured_image'] = _featuredImage;
    return map;
  }

}