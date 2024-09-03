/// data : {"userCarts":{"id":10552,"product_id":92,"product_name":"Fabby Furever Wet Wipes: Dogs & Cats. Natural Anti-Bacterial. Puppies & All Ages. Unscented. 100 Wipes, Pack of 10","user_id":712,"store_id":1,"unit_price_excl_vat":550,"single_unit_price_excl_vat":"550.00","vat_rate":0,"cart_count":1,"is_offer":0,"offer_type":0,"offer_rate":0,"offer_value":0,"discount_price":0,"discounted_qty":0,"prescription_order_status":0,"order_id":0,"buy_now":null,"guest_id":null},"user_cart_product_count":6}
/// success : true
/// error : 200
/// status_code : "Product already in cart"

class AddToCartModel {
  AddToCartModel({
      Data? data, 
      bool? success, 
      num? error, 
      String? statusCode,}){
    _data = data;
    _success = success;
    _error = error;
    _statusCode = statusCode;
}

  AddToCartModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _error = json['error'];
    _statusCode = json['status_code'];
  }
  Data? _data;
  bool? _success;
  num? _error;
  String? _statusCode;
AddToCartModel copyWith({  Data? data,
  bool? success,
  num? error,
  String? statusCode,
}) => AddToCartModel(  data: data ?? _data,
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

/// userCarts : {"id":10552,"product_id":92,"product_name":"Fabby Furever Wet Wipes: Dogs & Cats. Natural Anti-Bacterial. Puppies & All Ages. Unscented. 100 Wipes, Pack of 10","user_id":712,"store_id":1,"unit_price_excl_vat":550,"single_unit_price_excl_vat":"550.00","vat_rate":0,"cart_count":1,"is_offer":0,"offer_type":0,"offer_rate":0,"offer_value":0,"discount_price":0,"discounted_qty":0,"prescription_order_status":0,"order_id":0,"buy_now":null,"guest_id":null}
/// user_cart_product_count : 6

class Data {
  Data({
      UserCarts? userCarts, 
      num? userCartProductCount,}){
    _userCarts = userCarts;
    _userCartProductCount = userCartProductCount;
}

  Data.fromJson(dynamic json) {
    _userCarts = json['userCarts'] != null ? UserCarts.fromJson(json['userCarts']) : null;
    _userCartProductCount = json['user_cart_product_count'];
  }
  UserCarts? _userCarts;
  num? _userCartProductCount;
Data copyWith({  UserCarts? userCarts,
  num? userCartProductCount,
}) => Data(  userCarts: userCarts ?? _userCarts,
  userCartProductCount: userCartProductCount ?? _userCartProductCount,
);
  UserCarts? get userCarts => _userCarts;
  num? get userCartProductCount => _userCartProductCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userCarts != null) {
      map['userCarts'] = _userCarts?.toJson();
    }
    map['user_cart_product_count'] = _userCartProductCount;
    return map;
  }

}

/// id : 10552
/// product_id : 92
/// product_name : "Fabby Furever Wet Wipes: Dogs & Cats. Natural Anti-Bacterial. Puppies & All Ages. Unscented. 100 Wipes, Pack of 10"
/// user_id : 712
/// store_id : 1
/// unit_price_excl_vat : 550
/// single_unit_price_excl_vat : "550.00"
/// vat_rate : 0
/// cart_count : 1
/// is_offer : 0
/// offer_type : 0
/// offer_rate : 0
/// offer_value : 0
/// discount_price : 0
/// discounted_qty : 0
/// prescription_order_status : 0
/// order_id : 0
/// buy_now : null
/// guest_id : null

class UserCarts {
  UserCarts({
      num? id, 
      num? productId, 
      String? productName, 
      num? userId, 
      num? storeId, 
      num? unitPriceExclVat, 
      String? singleUnitPriceExclVat, 
      num? vatRate, 
      num? cartCount, 
      num? isOffer, 
      num? offerType, 
      num? offerRate, 
      num? offerValue, 
      num? discountPrice, 
      num? discountedQty, 
      num? prescriptionOrderStatus, 
      num? orderId, 
      dynamic buyNow, 
      dynamic guestId,}){
    _id = id;
    _productId = productId;
    _productName = productName;
    _userId = userId;
    _storeId = storeId;
    _unitPriceExclVat = unitPriceExclVat;
    _singleUnitPriceExclVat = singleUnitPriceExclVat;
    _vatRate = vatRate;
    _cartCount = cartCount;
    _isOffer = isOffer;
    _offerType = offerType;
    _offerRate = offerRate;
    _offerValue = offerValue;
    _discountPrice = discountPrice;
    _discountedQty = discountedQty;
    _prescriptionOrderStatus = prescriptionOrderStatus;
    _orderId = orderId;
    _buyNow = buyNow;
    _guestId = guestId;
}

  UserCarts.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _productName = json['product_name'];
    _userId = json['user_id'];
    _storeId = json['store_id'];
    _unitPriceExclVat = json['unit_price_excl_vat'];
    _singleUnitPriceExclVat = json['single_unit_price_excl_vat'];
    _vatRate = json['vat_rate'];
    _cartCount = json['cart_count'];
    _isOffer = json['is_offer'];
    _offerType = json['offer_type'];
    _offerRate = json['offer_rate'];
    _offerValue = json['offer_value'];
    _discountPrice = json['discount_price'];
    _discountedQty = json['discounted_qty'];
    _prescriptionOrderStatus = json['prescription_order_status'];
    _orderId = json['order_id'];
    _buyNow = json['buy_now'];
    _guestId = json['guest_id'];
  }
  num? _id;
  num? _productId;
  String? _productName;
  num? _userId;
  num? _storeId;
  num? _unitPriceExclVat;
  String? _singleUnitPriceExclVat;
  num? _vatRate;
  num? _cartCount;
  num? _isOffer;
  num? _offerType;
  num? _offerRate;
  num? _offerValue;
  num? _discountPrice;
  num? _discountedQty;
  num? _prescriptionOrderStatus;
  num? _orderId;
  dynamic _buyNow;
  dynamic _guestId;
UserCarts copyWith({  num? id,
  num? productId,
  String? productName,
  num? userId,
  num? storeId,
  num? unitPriceExclVat,
  String? singleUnitPriceExclVat,
  num? vatRate,
  num? cartCount,
  num? isOffer,
  num? offerType,
  num? offerRate,
  num? offerValue,
  num? discountPrice,
  num? discountedQty,
  num? prescriptionOrderStatus,
  num? orderId,
  dynamic buyNow,
  dynamic guestId,
}) => UserCarts(  id: id ?? _id,
  productId: productId ?? _productId,
  productName: productName ?? _productName,
  userId: userId ?? _userId,
  storeId: storeId ?? _storeId,
  unitPriceExclVat: unitPriceExclVat ?? _unitPriceExclVat,
  singleUnitPriceExclVat: singleUnitPriceExclVat ?? _singleUnitPriceExclVat,
  vatRate: vatRate ?? _vatRate,
  cartCount: cartCount ?? _cartCount,
  isOffer: isOffer ?? _isOffer,
  offerType: offerType ?? _offerType,
  offerRate: offerRate ?? _offerRate,
  offerValue: offerValue ?? _offerValue,
  discountPrice: discountPrice ?? _discountPrice,
  discountedQty: discountedQty ?? _discountedQty,
  prescriptionOrderStatus: prescriptionOrderStatus ?? _prescriptionOrderStatus,
  orderId: orderId ?? _orderId,
  buyNow: buyNow ?? _buyNow,
  guestId: guestId ?? _guestId,
);
  num? get id => _id;
  num? get productId => _productId;
  String? get productName => _productName;
  num? get userId => _userId;
  num? get storeId => _storeId;
  num? get unitPriceExclVat => _unitPriceExclVat;
  String? get singleUnitPriceExclVat => _singleUnitPriceExclVat;
  num? get vatRate => _vatRate;
  num? get cartCount => _cartCount;
  num? get isOffer => _isOffer;
  num? get offerType => _offerType;
  num? get offerRate => _offerRate;
  num? get offerValue => _offerValue;
  num? get discountPrice => _discountPrice;
  num? get discountedQty => _discountedQty;
  num? get prescriptionOrderStatus => _prescriptionOrderStatus;
  num? get orderId => _orderId;
  dynamic get buyNow => _buyNow;
  dynamic get guestId => _guestId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['product_name'] = _productName;
    map['user_id'] = _userId;
    map['store_id'] = _storeId;
    map['unit_price_excl_vat'] = _unitPriceExclVat;
    map['single_unit_price_excl_vat'] = _singleUnitPriceExclVat;
    map['vat_rate'] = _vatRate;
    map['cart_count'] = _cartCount;
    map['is_offer'] = _isOffer;
    map['offer_type'] = _offerType;
    map['offer_rate'] = _offerRate;
    map['offer_value'] = _offerValue;
    map['discount_price'] = _discountPrice;
    map['discounted_qty'] = _discountedQty;
    map['prescription_order_status'] = _prescriptionOrderStatus;
    map['order_id'] = _orderId;
    map['buy_now'] = _buyNow;
    map['guest_id'] = _guestId;
    return map;
  }

}