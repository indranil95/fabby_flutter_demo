import 'dart:convert';

AllProductModel allProductModelFromJson(String str) => AllProductModel.fromJson(json.decode(str));

String allProductModelToJson(AllProductModel data) => json.encode(data.toJson());

class AllProductModel {
  List<Datum> data;
  bool success;
  int error;
  String statusCode;

  AllProductModel({
    required this.data,
    required this.success,
    required this.error,
    required this.statusCode,
  });

  factory AllProductModel.fromJson(Map<String, dynamic> json) => AllProductModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    success: json["success"],
    error: json["error"],
    statusCode: json["status_code"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "error": error,
    "status_code": statusCode,
  };
}

class Datum {
  int id;
  String productName;
  String slug;
  String meteTitle;
  String metaDescription;
  String productId;
  int quantity;
  String price;
  String barcode;
  dynamic countryOfOrigin;
  dynamic vatRate;
  dynamic brandName;
  int? categoryId;
  int? subCategoryId;
  dynamic unit;
  String manufacturedBy;
  dynamic description;
  dynamic benefits;
  dynamic activeIngredients;
  String productImage;
  String productImgStatus;
  dynamic longDescription;
  dynamic howToUse;
  String whatIncluded;
  String? amazonLink;
  int height;
  int width;
  int length;
  double weight;
  dynamic type;
  int status;
  List<ProductImageArr> productImageArr;
  dynamic offers;
  Categories? categories;
  SubCategory? subCategory;
  List<Store> store;

  Datum({
    required this.id,
    required this.productName,
    required this.slug,
    required this.meteTitle,
    required this.metaDescription,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.barcode,
    required this.countryOfOrigin,
    required this.vatRate,
    required this.brandName,
    required this.categoryId,
    required this.subCategoryId,
    required this.unit,
    required this.manufacturedBy,
    required this.description,
    required this.benefits,
    required this.activeIngredients,
    required this.productImage,
    required this.productImgStatus,
    required this.longDescription,
    required this.howToUse,
    required this.whatIncluded,
    required this.amazonLink,
    required this.height,
    required this.width,
    required this.length,
    required this.weight,
    required this.type,
    required this.status,
    required this.productImageArr,
    required this.offers,
    required this.categories,
    required this.subCategory,
    required this.store,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    productName: json["product_name"],
    slug: json["slug"],
    meteTitle: json["mete_title"],
    metaDescription: json["meta_description"],
    productId: json["productId"],
    quantity: json["quantity"],
    price: json["price"],
    barcode: json["barcode"],
    countryOfOrigin: json["country_of_origin"],
    vatRate: json["vat_rate"],
    brandName: json["brand_name"],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    unit: json["unit"],
    manufacturedBy: json["manufactured_by"],
    description: json["description"],
    benefits: json["benefits"],
    activeIngredients: json["active_ingredients"],
    productImage: json["product_image"],
    productImgStatus: json["product_img_status"],
    longDescription: json["long_description"],
    howToUse: json["how_to_use"],
    whatIncluded: json["what_included"],
    amazonLink: json["amazon_link"],
    height: json["height"],
    width: json["width"],
    length: json["length"],
    weight: json["weight"]?.toDouble(),
    type: json["type"],
    status: json["status"],
    productImageArr: List<ProductImageArr>.from(json["product_image_arr"].map((x) => ProductImageArr.fromJson(x))),
    offers: json["offers"],
    categories: json["categories"] == null ? null : Categories.fromJson(json["categories"]),
    subCategory: json["sub_category"] == null ? null : SubCategory.fromJson(json["sub_category"]),
    store: List<Store>.from(json["store"].map((x) => Store.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "slug": slug,
    "mete_title": meteTitle,
    "meta_description": metaDescription,
    "productId": productId,
    "quantity": quantity,
    "price": price,
    "barcode": barcode,
    "country_of_origin": countryOfOrigin,
    "vat_rate": vatRate,
    "brand_name": brandName,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "unit": unit,
    "manufactured_by": manufacturedBy,
    "description": description,
    "benefits": benefits,
    "active_ingredients": activeIngredients,
    "product_image": productImage,
    "product_img_status": productImgStatus,
    "long_description": longDescription,
    "how_to_use": howToUse,
    "what_included": whatIncluded,
    "amazon_link": amazonLink,
    "height": height,
    "width": width,
    "length": length,
    "weight": weight,
    "type": type,
    "status": status,
    "product_image_arr": List<dynamic>.from(productImageArr.map((x) => x.toJson())),
    "offers": offers,
    "categories": categories?.toJson(),
    "sub_category": subCategory?.toJson(),
    "store": List<dynamic>.from(store.map((x) => x.toJson())),
  };
}

class Categories {
  int id;
  String categoriesName;

  Categories({
    required this.id,
    required this.categoriesName,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    id: json["id"],
    categoriesName: json["categories_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories_name": categoriesName,
  };
}

class ProductImageArr {
  int id;
  int productId;
  String image;
  int featuredImage;

  ProductImageArr({
    required this.id,
    required this.productId,
    required this.image,
    required this.featuredImage,
  });

  factory ProductImageArr.fromJson(Map<String, dynamic> json) => ProductImageArr(
    id: json["id"],
    productId: json["product_id"],
    image: json["image"],
    featuredImage: json["featured_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "image": image,
    "featured_image": featuredImage,
  };
}

class Store {
  int id;
  String storeName;
  String lat;
  String lng;
  String address;
  String storeContact;
  String storeEmail;
  String storeWorkingHours;
  int orderSlotThreshold;
  Pivot pivot;

  Store({
    required this.id,
    required this.storeName,
    required this.lat,
    required this.lng,
    required this.address,
    required this.storeContact,
    required this.storeEmail,
    required this.storeWorkingHours,
    required this.orderSlotThreshold,
    required this.pivot,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    storeName: json["store_name"],
    lat: json["lat"],
    lng: json["lng"],
    address: json["address"],
    storeContact: json["store_contact"],
    storeEmail: json["store_email"],
    storeWorkingHours: json["store_working_hours"],
    orderSlotThreshold: json["order_slot_threshold"],
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_name": storeName,
    "lat": lat,
    "lng": lng,
    "address": address,
    "store_contact": storeContact,
    "store_email": storeEmail,
    "store_working_hours": storeWorkingHours,
    "order_slot_threshold": orderSlotThreshold,
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  int productId;
  int storeId;
  int productQuantity;
  DateTime createdAt;
  DateTime updatedAt;

  Pivot({
    required this.productId,
    required this.storeId,
    required this.productQuantity,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    productId: json["product_id"],
    storeId: json["store_id"],
    productQuantity: json["product_quantity"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "store_id": storeId,
    "product_quantity": productQuantity,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class SubCategory {
  int id;
  String subcategoryName;

  SubCategory({
    required this.id,
    required this.subcategoryName,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    subcategoryName: json["subcategory_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subcategory_name": subcategoryName,
  };
}