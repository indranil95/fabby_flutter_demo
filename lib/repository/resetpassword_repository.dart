import 'package:flutter_fabby_demo/models/resetpassword_model.dart';
import 'package:flutter_fabby_demo/models/verifyotp_model.dart';

import '../network/api_service.dart';

class ResetPasswordRepository{
  final ApiService apiService;

  ResetPasswordRepository(this.apiService);

  Future<ResetPasswordModel?> passwordReset(Map<String, dynamic> requestBody) async {
    final response = await apiService.passwordReset<ResetPasswordModel>(
      requestBody,
          (json) => ResetPasswordModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }

}