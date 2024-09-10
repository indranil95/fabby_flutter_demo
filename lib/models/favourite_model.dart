/// data : {"favorite":"true"}
/// success : true
/// error : 200
/// status_code : "Product removed from wishlist successfully"

class FavouriteModel {
  FavouriteModel({
      Data? data, 
      bool? success, 
      num? error, 
      String? statusCode,}){
    _data = data;
    _success = success;
    _error = error;
    _statusCode = statusCode;
}

  FavouriteModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _error = json['error'];
    _statusCode = json['status_code'];
  }
  Data? _data;
  bool? _success;
  num? _error;
  String? _statusCode;
FavouriteModel copyWith({  Data? data,
  bool? success,
  num? error,
  String? statusCode,
}) => FavouriteModel(  data: data ?? _data,
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

/// favorite : "true"

class Data {
  Data({
      String? favorite,}){
    _favorite = favorite;
}

  Data.fromJson(dynamic json) {
    _favorite = json['favorite'];
  }
  String? _favorite;
Data copyWith({  String? favorite,
}) => Data(  favorite: favorite ?? _favorite,
);
  String? get favorite => _favorite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['favorite'] = _favorite;
    return map;
  }

}