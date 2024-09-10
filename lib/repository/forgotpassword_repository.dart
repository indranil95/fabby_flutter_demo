import '../models/sendotp_model.dart';
import '../network/api_service.dart';

class ForgotPasswordRepository{
  final ApiService apiService;

  ForgotPasswordRepository(this.apiService);

  Future<SendOtpModel?> sendOtpRequest(Map<String, dynamic> requestBody) async {
    final response = await apiService.sendOtp<SendOtpModel>(
      requestBody,
          (json) => SendOtpModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }

}