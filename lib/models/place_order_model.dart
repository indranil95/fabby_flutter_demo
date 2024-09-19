import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PlaceOrderModel {
  final Data data;
  final int error;
  @JsonKey(name: 'status_code')
  final String statusCode;
  final bool success;

  PlaceOrderModel({
    required this.data,
    required this.error,
    required this.statusCode,
    required this.success,
  });

  factory PlaceOrderModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'coupon_discount_amount')
  final int couponDiscountAmount;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'customer_address_id')
  final String customerAddressId;
  final int id;
  @JsonKey(name: 'order_amount')
  final double orderAmount;
  @JsonKey(name: 'order_detail')
  final List<OrderDetail> orderDetail;
  @JsonKey(name: 'orderId')
  final String orderId;
  @JsonKey(name: 'orderStatusCatalog')
  final List<dynamic> orderStatusCatalog;
  @JsonKey(name: 'order_types')
  final int orderTypes;
  @JsonKey(name: 'payment_id')
  final int paymentId;
  @JsonKey(name: 'payment_orderReference')
  final String paymentOrderReference;
  final List<Product> product;
  @JsonKey(name: 'shipping_charges')
  final String shippingCharges;
  final List<Store> store;
  @JsonKey(name: 'store_id')
  final int storeId;
  final int tax;
  @JsonKey(name: 'total_amount_excl_vat')
  final double totalAmountExclVat;
  @JsonKey(name: 'total_vat_amount')
  final String totalVatAmount;
  @JsonKey(name: 'updated_status')
  final String updatedStatus;
  @JsonKey(name: 'user_id')
  final int userId;

  Data({
    required this.couponDiscountAmount,
    required this.createdAt,
    required this.customerAddressId,
    required this.id,
    required this.orderAmount,
    required this.orderDetail,
    required this.orderId,
    required this.orderStatusCatalog,
    required this.orderTypes,
    required this.paymentId,
    required this.paymentOrderReference,
    required this.product,
    required this.shippingCharges,
    required this.store,
    required this.storeId,
    required this.tax,
    required this.totalAmountExclVat,
    required this.totalVatAmount,
    required this.updatedStatus,
    required this.userId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class OrderDetail {
  @JsonKey(name: 'deleted_at')
  final dynamic deletedAt;
  @JsonKey(name: 'discount_price')
  final String discountPrice;
  @JsonKey(name: 'discounted_qty')
  final int discountedQty;
  @JsonKey(name: 'edit_reason')
  final dynamic editReason;
  final int id;
  @JsonKey(name: 'is_offer')
  final int isOffer;
  @JsonKey(name: 'offer_rate')
  final String offerRate;
  @JsonKey(name: 'offer_type')
  final int offerType;
  @JsonKey(name: 'offer_value')
  final int offerValue;
  @JsonKey(name: 'order_id')
  final int orderId;
  @JsonKey(name: 'pick_status')
  final dynamic pickStatus;
  final Product product;
  @JsonKey(name: 'product_id')
  final int productId;
  @JsonKey(name: 'product_name')
  final String productName;
  @JsonKey(name: 'product_picked')
  final int productPicked;
  final int quantity;
  @JsonKey(name: 'replace_product')
  final int replaceProduct;
  @JsonKey(name: 'replace_reason')
  final dynamic replaceReason;
  @JsonKey(name: 'return_reason')
  final dynamic returnReason;
  @JsonKey(name: 'return_request')
  final int returnRequest;
  @JsonKey(name: 'single_unit_price')
  final String singleUnitPrice;
  @JsonKey(name: 'total_price')
  final String totalPrice;
  @JsonKey(name: 'unit_price')
  final String unitPrice;
  @JsonKey(name: 'vat_rate')
  final String vatRate;

  OrderDetail({
    required this.deletedAt,
    required this.discountPrice,
    required this.discountedQty,
    required this.editReason,
    required this.id,
    required this.isOffer,
    required this.offerRate,
    required this.offerType,
    required this.offerValue,
    required this.orderId,
    required this.pickStatus,
    required this.product,
    required this.productId,
    required this.productName,
    required this.productPicked,
    required this.quantity,
    required this.replaceProduct,
    required this.replaceReason,
    required this.returnReason,
    required this.returnRequest,
    required this.singleUnitPrice,
    required this.totalPrice,
    required this.unitPrice,
    required this.vatRate,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: 'active_ingredients')
  final dynamic activeIngredients;
  @JsonKey(name: 'amazon_link')
  final String amazonLink;
  final String barcode;
  final dynamic benefits;
  @JsonKey(name: 'brand_name')
  final dynamic brandName;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'country_of_origin')
  final dynamic countryOfOrigin;
  final dynamic description;
  final int height;
  @JsonKey(name: 'how_to_use')
  final dynamic howToUse;
  final int id;
  final int length;
  @JsonKey(name: 'long_description')
  final dynamic longDescription;
  @JsonKey(name: 'manufactured_by')
  final String manufacturedBy;
  final String price;
  @JsonKey(name: 'productId')
  final String productId;
  @JsonKey(name: 'product_image')
  final dynamic productImage;
  @JsonKey(name: 'product_img_status')
  final String productImgStatus;
  @JsonKey(name: 'product_name')
  final String productName;
  final int quantity;
  final String slug;
  final int status;
  @JsonKey(name: 'sub_category_id')
  final int subCategoryId;
  final dynamic type;
  final dynamic unit;
  @JsonKey(name: 'vat_rate')
  final dynamic vatRate;
  final double weight;
  @JsonKey(name: 'what_included')
  final String whatIncluded;
  final int width;

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
    required this.slug,
    required this.status,
    required this.subCategoryId,
    required this.type,
    required this.unit,
    required this.vatRate,
    required this.weight,
    required this.whatIncluded,
    required this.width,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Store {
  final String address;
  final int id;
  final String lat;
  final String lng;
  @JsonKey(name: 'order_slot_threshold')
  final int orderSlotThreshold;
  @JsonKey(name: 'store_contact')
  final String storeContact;
  @JsonKey(name: 'store_email')
  final String storeEmail;
  @JsonKey(name: 'store_name')
  final String storeName;
  @JsonKey(name: 'store_working_hours')
  final String storeWorkingHours;

  Store({
    required this.address,
    required this.id,
    required this.lat,
    required this.lng,
    required this.orderSlotThreshold,
    required this.storeContact,
    required this.storeEmail,
    required this.storeName,
    required this.storeWorkingHours,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
