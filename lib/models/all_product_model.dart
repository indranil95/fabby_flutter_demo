class AllProductModel {
  AllProductModel({
    required this.data,
    required this.success,
    required this.error,
    required this.statusCode,
  });
  late final List<Data> data;
  late final bool success;
  late final int error;
  late final String statusCode;

  AllProductModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    success = json['success'];
    error = json['error'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['success'] = success;
    _data['error'] = error;
    _data['status_code'] = statusCode;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.productName,
    required this.slug,
    required this.meteTitle,
    required this.metaDescription,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.barcode,
    this.countryOfOrigin,
    this.vatRate,
    this.brandName,
    this.categoryId,
    required this.subCategoryId,
    this.unit,
    required this.manufacturedBy,
    this.description,
    this.benefits,
    this.activeIngredients,
    required this.productImage,
    required this.productImgStatus,
    this.longDescription,
    this.howToUse,
    required this.whatIncluded,
    this.amazonLink,
    required this.height,
    required this.width,
    required this.length,
    required this.weight,
    this.type,
    required this.status,
    required this.productImageArr,
    this.offers,
    this.categories,
    required this.subCategory,
    required this.store,
  });
  late final int id;
  late final String productName;
  late final String slug;
  late final String meteTitle;
  late final String metaDescription;
  late final String productId;
  late final int quantity;
  late final String price;
  late final String barcode;
  late final Null countryOfOrigin;
  late final Null vatRate;
  late final Null brandName;
  late final int? categoryId;
  late final int subCategoryId;
  late final Null unit;
  late final String manufacturedBy;
  late final Null description;
  late final Null benefits;
  late final Null activeIngredients;
  late final String productImage;
  late final String productImgStatus;
  late final Null longDescription;
  late final Null howToUse;
  late final String whatIncluded;
  late final String? amazonLink;
  late final int height;
  late final int width;
  late final int length;
  late final double weight;
  late final Null type;
  late final int status;
  late final List<ProductImageArr> productImageArr;
  late final Null offers;
  late final Categories? categories;
  late final SubCategory subCategory;
  late final List<Store> store;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    productName = json['product_name'];
    slug = json['slug'];
    meteTitle = json['mete_title'];
    metaDescription = json['meta_description'];
    productId = json['productId'];
    quantity = json['quantity'];
    price = json['price'];
    barcode = json['barcode'];
    countryOfOrigin = null;
    vatRate = null;
    brandName = null;
    categoryId = null;
    subCategoryId = json['sub_category_id'];
    unit = null;
    manufacturedBy = json['manufactured_by'];
    description = null;
    benefits = null;
    activeIngredients = null;
    productImage = json['product_image'];
    productImgStatus = json['product_img_status'];
    longDescription = null;
    howToUse = null;
    whatIncluded = json['what_included'];
    amazonLink = null;
    height = json['height'];
    width = json['width'];
    length = json['length'];
    weight = json['weight'];
    type = null;
    status = json['status'];
    productImageArr = List.from(json['product_image_arr']).map((e)=>ProductImageArr.fromJson(e)).toList();
    offers = null;
    categories = null;
    subCategory = SubCategory.fromJson(json['sub_category']);
    store = List.from(json['store']).map((e)=>Store.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_name'] = productName;
    _data['slug'] = slug;
    _data['mete_title'] = meteTitle;
    _data['meta_description'] = metaDescription;
    _data['productId'] = productId;
    _data['quantity'] = quantity;
    _data['price'] = price;
    _data['barcode'] = barcode;
    _data['country_of_origin'] = countryOfOrigin;
    _data['vat_rate'] = vatRate;
    _data['brand_name'] = brandName;
    _data['category_id'] = categoryId;
    _data['sub_category_id'] = subCategoryId;
    _data['unit'] = unit;
    _data['manufactured_by'] = manufacturedBy;
    _data['description'] = description;
    _data['benefits'] = benefits;
    _data['active_ingredients'] = activeIngredients;
    _data['product_image'] = productImage;
    _data['product_img_status'] = productImgStatus;
    _data['long_description'] = longDescription;
    _data['how_to_use'] = howToUse;
    _data['what_included'] = whatIncluded;
    _data['amazon_link'] = amazonLink;
    _data['height'] = height;
    _data['width'] = width;
    _data['length'] = length;
    _data['weight'] = weight;
    _data['type'] = type;
    _data['status'] = status;
    _data['product_image_arr'] = productImageArr.map((e)=>e.toJson()).toList();
    _data['offers'] = offers;
    _data['categories'] = categories;
    _data['sub_category'] = subCategory.toJson();
    _data['store'] = store.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ProductImageArr {
  ProductImageArr({
    required this.id,
    required this.productId,
    required this.image,
    required this.featuredImage,
  });
  late final int id;
  late final int productId;
  late final String image;
  late final int featuredImage;

  ProductImageArr.fromJson(Map<String, dynamic> json){
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    featuredImage = json['featured_image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_id'] = productId;
    _data['image'] = image;
    _data['featured_image'] = featuredImage;
    return _data;
  }
}

class Categories {
  Categories({
    required this.id,
    required this.categoriesName,
  });
  late final int id;
  late final String categoriesName;

  Categories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    categoriesName = json['categories_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['categories_name'] = categoriesName;
    return _data;
  }
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.subcategoryName,
  });
  late final int id;
  late final String subcategoryName;

  SubCategory.fromJson(Map<String, dynamic> json){
    id = json['id'];
    subcategoryName = json['subcategory_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['subcategory_name'] = subcategoryName;
    return _data;
  }
}

class Store {
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
  late final int id;
  late final String storeName;
  late final String lat;
  late final String lng;
  late final String address;
  late final String storeContact;
  late final String storeEmail;
  late final String storeWorkingHours;
  late final int orderSlotThreshold;
  late final Pivot pivot;

  Store.fromJson(Map<String, dynamic> json){
    id = json['id'];
    storeName = json['store_name'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    storeContact = json['store_contact'];
    storeEmail = json['store_email'];
    storeWorkingHours = json['store_working_hours'];
    orderSlotThreshold = json['order_slot_threshold'];
    pivot = Pivot.fromJson(json['pivot']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['store_name'] = storeName;
    _data['lat'] = lat;
    _data['lng'] = lng;
    _data['address'] = address;
    _data['store_contact'] = storeContact;
    _data['store_email'] = storeEmail;
    _data['store_working_hours'] = storeWorkingHours;
    _data['order_slot_threshold'] = orderSlotThreshold;
    _data['pivot'] = pivot.toJson();
    return _data;
  }
}

class Pivot {
  Pivot({
    required this.productId,
    required this.storeId,
    required this.productQuantity,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int productId;
  late final int storeId;
  late final int productQuantity;
  late final String createdAt;
  late final String updatedAt;

  Pivot.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    storeId = json['store_id'];
    productQuantity = json['product_quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['store_id'] = storeId;
    _data['product_quantity'] = productQuantity;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}