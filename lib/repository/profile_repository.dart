import '../models/profile_model.dart';
import '../network/api_service.dart';

class ProfileRepository {
  final ApiService apiService;

  ProfileRepository(this.apiService);

  // Function to fetch user profile
  // Future<ProfileModel?> getProfile(Map<String, dynamic> requestBody) async {
  //   final response = await apiService.getProfile<ProfileModel>(
  //     requestBody,
  //         (json) => ProfileModel.fromJson(json), // Convert the JSON response to ProfileModel
  //   );
  //
  //   // Handle error scenario
  //   if (response.error != null) {
  //     throw Exception(response.error);
  //   }
  //
  //   // Return profile data if no error occurred
  //   return response.data;
  // }

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
}