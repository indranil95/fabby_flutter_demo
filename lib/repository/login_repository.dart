import 'package:flutter_fabby_demo/models/login_model.dart';

import '../network/api_service.dart';

class LoginRepository{
  final ApiService apiService;

  LoginRepository(this.apiService);

  Future<LoginModel?> sendLoginRequest(Map<String, dynamic> requestBody) async {
    final response = await apiService.login<LoginModel>(
      requestBody,
          (json) => LoginModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }

}