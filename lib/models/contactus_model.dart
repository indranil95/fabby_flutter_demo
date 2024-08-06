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
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['success'] = success;
    _data['error'] = error;
    _data['status_code'] = statusCode;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['id'] = id;
    _data['message'] = message;
    _data['mobile'] = mobile;
    _data['name'] = name;
    return _data;
  }
}
