class DeletedAddressModel {
  final Data data;
  final int error;
  final String statusCode;
  final bool success;

  DeletedAddressModel({
    required this.data,
    required this.error,
    required this.statusCode,
    required this.success,
  });

  // Factory constructor to create a DeletedAddressModel instance from JSON
  factory DeletedAddressModel.fromJson(Map<String, dynamic> json) {
    return DeletedAddressModel(
      data: Data.fromJson(json['data']),
      error: json['error'],
      statusCode: json['status_code'],
      success: json['success'],
    );
  }

  // Method to convert a DeletedAddressModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'error': error,
      'status_code': statusCode,
      'success': success,
    };
  }
}

class Data {
  // The Kotlin Data class is empty, so it will be empty in Dart too.

  Data();

  // Factory constructor to create a Data instance from JSON
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data();
  }

  // Method to convert a Data instance to JSON
  Map<String, dynamic> toJson() {
    return {};
  }
}
