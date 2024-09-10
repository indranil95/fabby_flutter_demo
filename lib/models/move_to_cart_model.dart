/// data : {}
/// success : true
/// error : 200
/// status_code : "Success"
library;

class MoveToCartModel {
  MoveToCartModel({
      dynamic data, 
      bool? success, 
      num? error, 
      String? statusCode,}){
    _data = data;
    _success = success;
    _error = error;
    _statusCode = statusCode;
}

  MoveToCartModel.fromJson(dynamic json) {
    _data = json['data'];
    _success = json['success'];
    _error = json['error'];
    _statusCode = json['status_code'];
  }
  dynamic _data;
  bool? _success;
  num? _error;
  String? _statusCode;
MoveToCartModel copyWith({  dynamic data,
  bool? success,
  num? error,
  String? statusCode,
}) => MoveToCartModel(  data: data ?? _data,
  success: success ?? _success,
  error: error ?? _error,
  statusCode: statusCode ?? _statusCode,
);
  dynamic get data => _data;
  bool? get success => _success;
  num? get error => _error;
  String? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = _data;
    map['success'] = _success;
    map['error'] = _error;
    map['status_code'] = _statusCode;
    return map;
  }

}