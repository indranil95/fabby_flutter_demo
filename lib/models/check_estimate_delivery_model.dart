import 'dart:convert'; // For JSON decoding

class CheckEstimateDeliveryModel {
  CheckEstimateDeliveryModel({
    Data? data,
    bool? success,
    num? error,
    String? statusCode,
  }) {
    _data = data;
    _success = success;
    _error = error;
    _statusCode = statusCode;
  }

  CheckEstimateDeliveryModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      final decodedData = jsonDecode(json['data']); // Decode the 'data' JSON string
      _data = Data.fromJson(decodedData); // Initialize the 'Data' object
    }
    _success = json['success'];
    _error = json['error'];
    _statusCode = json['status_code'];
  }

  Data? _data;
  bool? _success;
  num? _error;
  String? _statusCode;

  Data? get data => _data;
  bool? get success => _success;
  num? get error => _error;
  String? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = jsonEncode(_data?.toJson()); // Convert back to JSON string
    }
    map['success'] = _success;
    map['error'] = _error;
    map['status_code'] = _statusCode;
    return map;
  }
}

class Data {
  Data({
    this.date,
    this.days,
  });

  String? date;
  String? days;

  // Parse the nested 'available_courier_companies' structure
  Data.fromJson(dynamic json) {
    if (json['data'] != null && json['data']['available_courier_companies'] != null) {
      var companies = json['data']['available_courier_companies'];
      if (companies is List && companies.isNotEmpty) {
        var firstCompany = companies[0]; // Access the first courier company in the list
        date = firstCompany['etd']; // Extract the 'etd' (estimated delivery date)
        days = firstCompany['estimated_delivery_days']; // Extract 'estimated_delivery_days'
      }
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['days'] = days;
    return map;
  }
}
