import 'dart:convert';

// Convert a JSON string to a ResetPasswordModel instance
ResetPasswordModel resetPasswordModelFromJson(String str) =>
    ResetPasswordModel.fromJson(json.decode(str));

// Convert a ResetPasswordModel instance to a JSON string
String resetPasswordModelToJson(ResetPasswordModel data) =>
    json.encode(data.toJson());

class ResetPasswordModel {
  Data data;
  int error;
  String statusCode;
  bool success;

  ResetPasswordModel({
    required this.data,
    required this.error,
    required this.statusCode,
    required this.success,
  });

  // Create a ResetPasswordModel instance from a JSON map
  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordModel(
        data: Data.fromJson(json["data"]),
        error: json["error"],
        statusCode: json["status_code"],
        success: json["success"],
      );

  // Convert a ResetPasswordModel instance to a JSON map
  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "error": error,
    "status_code": statusCode,
    "success": success,
  };
}

class Data {
  // Add fields specific to the Data class here, if any
  // For example:
  // String someField;

  Data();

  // Create a Data instance from a JSON map
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    // Parse fields from JSON if available
  );

  // Convert a Data instance to a JSON map
  Map<String, dynamic> toJson() => {
    // Add fields for conversion to JSON
  };
}
