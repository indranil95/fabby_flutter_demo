import '../models/banner_model.dart';
import '../network/api_service.dart';
import '../network/base_response.dart';

class DashboardRepository {
  final ApiService apiService;

  DashboardRepository(this.apiService);

  Future<BannerModel?> fetchData() async {
    final response = await apiService.getBanner<BannerModel>(
      'banner',
          (json) => BannerModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
}
