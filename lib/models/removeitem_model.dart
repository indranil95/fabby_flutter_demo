class RemoveItemModel {
  final Data data;
  final int error;
  final String statusCode;
  final bool success;

  RemoveItemModel({
    required this.data,
    required this.error,
    required this.statusCode,
    required this.success,
  });

  factory RemoveItemModel.fromJson(Map<String, dynamic> json) {
    return RemoveItemModel(
      data: Data.fromJson(json['data']),
      error: json['error'],
      statusCode: json['status_code'],
      success: json['success'],
    );
  }

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
  // Define the fields of the Data class if there are any.
  // For this example, we'll leave it empty as per the Kotlin code.

  Data();

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      // Initialize fields if there are any.
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // Add fields here if there are any.
    };
  }
}
