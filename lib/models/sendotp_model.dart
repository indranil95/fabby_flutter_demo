class SendOtpModel {
  Data? data;
  int? error;
  String? statusCode;
  bool? success;

  SendOtpModel({
    this.data,
    this.error,
    this.statusCode,
    this.success,
  });

  SendOtpModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    error = json['error'];
    statusCode = json['status_code'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = error;
    data['status_code'] = statusCode;
    data['success'] = success;
    return data;
  }
}

class Data {
  // Add fields here based on your actual Data class definition
  // Example fields:
  String? exampleField;

  Data({
    this.exampleField,
  });

  Data.fromJson(Map<String, dynamic> json) {
    exampleField = json['example_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['example_field'] = exampleField;
    return data;
  }
}
