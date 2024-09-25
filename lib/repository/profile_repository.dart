import '../models/profile_model.dart';
import '../network/api_service.dart';

class ProfileRepository {
  final ApiService apiService;

  ProfileRepository(this.apiService);

  Future<ProfileModel?> getProfile(
      int userId,
      ) async {
    final response = await apiService.getProfile<ProfileModel>(
      userId,
          (json) => ProfileModel.fromJson(json),
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }

  Future<ProfileModel?> updateProfile(Map<String, dynamic> requestBody) async {
    final response = await apiService.updateProfile<ProfileModel>(
      requestBody,
          (json) => ProfileModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
}