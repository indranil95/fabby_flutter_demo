import 'dart:convert';

// Convert a JSON string to a WishListModel instance
WishListModel wishListModelFromJson(String str) => WishListModel.fromJson(json.decode(str));

// Convert a WishListModel instance to a JSON string
String wishListModelToJson(WishListModel data) => json.encode(data.toJson());

class WishListModel {
  List<Data> data;
  String error;
  String statusCode;
  bool success;

  WishListModel({
    required this.data,
    required this.error,
    required this.statusCode,
    required this.success,
  });

  // Create a WishListModel instance from a JSON map
  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    error: json["error"],
    statusCode: json["status_code"],
    success: json["success"],
  );

  // Convert a WishListModel instance to a JSON map
  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "error": error,
    "status_code": statusCode,
    "success": success,
  };
}

class Data {
  String guestId;
  int id;
  Product product;
  int productId;
  int userId;
  bool isCheck;

  Data({
    required this.guestId,
    required this.id,
    required this.product,
    required this.productId,
    required this.userId,
    required this.isCheck,
  });

  // Create a Data instance from a JSON map
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    guestId: json["guestid"],
    id: json["id"],
    product: Product.fromJson(json["product"]),
    productId: json["product_id"],
    userId: json["user_id"],
    isCheck: json["isCheck"],
  );

  // Convert a Data instance to a JSON map
  Map<String, dynamic> toJson() => {
    "guestid": guestId,
    "id": id,
    "product": product.toJson(),
    "product_id": productId,
    "user_id": userId,
    "isCheck": isCheck,
  };
}

class Product {
  dynamic activeIngredients;
  String amazonLink;
  String barcode;
  dynamic benefits;
  dynamic brandName;
  int categoryId;
  dynamic countryOfOrigin;
  dynamic description;
  int height;
  dynamic howToUse;
  int id;
  int length;
  dynamic longDescription;
  String manufacturedBy;
  String price;
  String productId;
  String productImage;
  String productImgStatus;
  String productName;
  int quantity;
  int status;
  int subCategoryId;
  dynamic type;
  dynamic unit;
  dynamic vatRate;
  double weight;
  String whatIncluded;
  int width;

  Product({
    required this.activeIngredients,
    required this.amazonLink,
    required this.barcode,
    required this.benefits,
    required this.brandName,
    required this.categoryId,
    required this.countryOfOrigin,
    required this.description,
    required this.height,
    required this.howToUse,
    required this.id,
    required this.length,
    required this.longDescription,
    required this.manufacturedBy,
    required this.price,
    required this.productId,
    required this.productImage,
    required this.productImgStatus,
    required this.productName,
    required this.quantity,
    required this.status,
    required this.subCategoryId,
    required this.type,
    required this.unit,
    required this.vatRate,
    required this.weight,
    required this.whatIncluded,
    required this.width,
  });

  // Create a Product instance from a JSON map
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    activeIngredients: json["active_ingredients"],
    amazonLink: json["amazon_link"],
    barcode: json["barcode"],
    benefits: json["benefits"],
    brandName: json["brand_name"],
    categoryId: json["category_id"],
    countryOfOrigin: json["country_of_origin"],
    description: json["description"],
    height: json["height"],
    howToUse: json["how_to_use"],
    id: json["id"],
    length: json["length"],
    longDescription: json["long_description"],
    manufacturedBy: json["manufactured_by"],
    price: json["price"],
    productId: json["productId"],
    productImage: json["product_image"],
    productImgStatus: json["product_img_status"],
    productName: json["product_name"],
    quantity: json["quantity"],
    status: json["status"],
    subCategoryId: json["sub_category_id"],
    type: json["type"],
    unit: json["unit"],
    vatRate: json["vat_rate"],
    weight: json["weight"].toDouble(),
    whatIncluded: json["what_included"],
    width: json["width"],
  );

  // Convert a Product instance to a JSON map
  Map<String, dynamic> toJson() => {
    "active_ingredients": activeIngredients,
    "amazon_link": amazonLink,
    "barcode": barcode,
    "benefits": benefits,
    "brand_name": brandName,
    "category_id": categoryId,
    "country_of_origin": countryOfOrigin,
    "description": description,
    "height": height,
    "how_to_use": howToUse,
    "id": id,
    "length": length,
    "long_description": longDescription,
    "manufactured_by": manufacturedBy,
    "price": price,
    "productId": productId,
    "product_image": productImage,
    "product_img_status": productImgStatus,
    "product_name": productName,
    "quantity": quantity,
    "status": status,
    "sub_category_id": subCategoryId,
    "type": type,
    "unit": unit,
    "vat_rate": vatRate,
    "weight": weight,
    "what_included": whatIncluded,
    "width": width,
  };
}
