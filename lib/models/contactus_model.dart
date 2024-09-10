class ContactUsModel {
  ContactUsModel({
    required this.data,
    required this.success,
    required this.error,
    required this.statusCode,
  });

  late final Data data;
  late final bool success;
  late final int error;
  late final String statusCode;

  ContactUsModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    success = json['success'];
    error = json['error'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = data.toJson();
    data['success'] = success;
    data['error'] = error;
    data['status_code'] = statusCode;
    return data;
  }
}

class Data {
  Data({
    required this.email,
    required this.id,
    required this.message,
    required this.mobile,
    required this.name,
  });

  late final String email;
  late final int id;
  late final String message;
  late final String mobile;
  late final String name;

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    message = json['message'];
    mobile = json['mobile'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['id'] = id;
    data['message'] = message;
    data['mobile'] = mobile;
    data['name'] = name;
    return data;
  }
}
