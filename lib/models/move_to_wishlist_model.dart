/// data : {"user_cart_product_count":0}
/// success : true
/// error : 200
/// status_code : "Success Removed From Cart"

class MoveToWishListModel {
  MoveToWishListModel({
    Data? data,
    bool? success,
    num? error,
    String? statusCode,}){
    _data = data;
    _success = success;
    _error = error;
    _statusCode = statusCode;
  }

  MoveToWishListModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _error = json['error'];
    _statusCode = json['status_code'];
  }
  Data? _data;
  bool? _success;
  num? _error;
  String? _statusCode;
  MoveToWishListModel copyWith({  Data? data,
    bool? success,
    num? error,
    String? statusCode,
  }) => MoveToWishListModel(  data: data ?? _data,
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

/// user_cart_product_count : 0

class Data {
  Data({
    num? userCartProductCount,}){
    _userCartProductCount = userCartProductCount;
  }

  Data.fromJson(dynamic json) {
    _userCartProductCount = json['user_cart_product_count'];
  }
  num? _userCartProductCount;
  Data copyWith({  num? userCartProductCount,
  }) => Data(  userCartProductCount: userCartProductCount ?? _userCartProductCount,
  );
  num? get userCartProductCount => _userCartProductCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_cart_product_count'] = _userCartProductCount;
    return map;
  }

}