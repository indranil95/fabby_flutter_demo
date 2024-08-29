class WishListModel {
  List<Data> data;
  String? error;
  String? statusCode;
  bool success;

  WishListModel({
    required this.data,
    this.error,
    this.statusCode,
    required this.success,
  });

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    error: json["error"]?.toString(),
    statusCode: json["status_code"]?.toString(),
    success: json["success"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "error": error,
    "status_code": statusCode,
    "success": success,
  };
}

class Data {
  String? guestId;
  int id;
  Product product;
  int productId;
  int userId;
  bool isCheck;

  Data({
    this.guestId,
    required this.id,
    required this.product,
    required this.productId,
    required this.userId,
    required this.isCheck,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    guestId: json["guestid"]?.toString(),
    id: json["id"],
    product: Product.fromJson(json["product"]),
    productId: json["product_id"],
    userId: json["user_id"],
    isCheck: json["isCheck"] ?? false,
  );

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
  String? amazonLink;
  String? barcode;
  dynamic benefits;
  dynamic brandName;
  int? categoryId;
  dynamic countryOfOrigin;
  dynamic description;
  int height;
  dynamic howToUse;
  int id;
  int length;
  dynamic longDescription;
  String? manufacturedBy;
  String price;
  String productId;
  String productImage;
  String? productImgStatus;
  String productName;
  int quantity;
  int status;
  int? subCategoryId;
  dynamic type;
  dynamic unit;
  dynamic vatRate;
  double weight;
  String? whatIncluded;
  int width;

  Product({
    this.activeIngredients,
    this.amazonLink,
    this.barcode,
    this.benefits,
    this.brandName,
    this.categoryId,
    this.countryOfOrigin,
    this.description,
    required this.height,
    this.howToUse,
    required this.id,
    required this.length,
    this.longDescription,
    this.manufacturedBy,
    required this.price,
    required this.productId,
    required this.productImage,
    this.productImgStatus,
    required this.productName,
    required this.quantity,
    required this.status,
    this.subCategoryId,
    this.type,
    this.unit,
    this.vatRate,
    required this.weight,
    this.whatIncluded,
    required this.width,
  });

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
    weight: json["weight"]?.toDouble() ?? 0.0,
    whatIncluded: json["what_included"],
    width: json["width"],
  );

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
