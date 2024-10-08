import '../models/sendotp_model.dart';
import '../models/signup_model.dart';
import '../network/api_service.dart';

class SignupRepository{
  final ApiService apiService;

  SignupRepository(this.apiService);

  Future<SignUpModel?> sendSignUpRequest(Map<String, dynamic> requestBody) async {
    final response = await apiService.signUp<SignUpModel>(
      requestBody,
          (json) => SignUpModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
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