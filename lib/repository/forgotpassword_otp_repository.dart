import 'package:flutter_fabby_demo/models/verifyotp_model.dart';

import '../network/api_service.dart';

class ForgotPasswordOtpRepository{
  final ApiService apiService;

  ForgotPasswordOtpRepository(this.apiService);

  Future<VerifyOtpModel?> sendVerifyOtpRequest(Map<String, dynamic> requestBody) async {
    final response = await apiService.verifyOtpMobile<VerifyOtpModel>(
      requestBody,
          (json) => VerifyOtpModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }

}