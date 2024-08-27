import 'dart:convert';

// Convert a JSON string to a VerifyOtpModel instance
VerifyOtpModel verifyOtpModelFromJson(String str) => VerifyOtpModel.fromJson(json.decode(str));

// Convert a VerifyOtpModel instance to a JSON string
String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
  int data;
  int error;
  String statusCode;
  bool success;
  String uniqueId;

  VerifyOtpModel({
    required this.data,
    required this.error,
    required this.statusCode,
    required this.success,
    required this.uniqueId,
  });

  // Create a VerifyOtpModel instance from a JSON map
  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
    data: json["data"],
    error: json["error"],
    statusCode: json["status_code"],
    success: json["success"],
    uniqueId: json["unique_id"],
  );

  // Convert a VerifyOtpModel instance to a JSON map
  Map<String, dynamic> toJson() => {
    "data": data,
    "error": error,
    "status_code": statusCode,
    "success": success,
    "unique_id": uniqueId,
  };
}
