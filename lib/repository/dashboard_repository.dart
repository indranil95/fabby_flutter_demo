import 'package:flutter_fabby_demo/models/all_product_model.dart';
import 'package:flutter_fabby_demo/models/guest_model.dart';

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
  Future<GuestModel?> guestData() async {
    final response = await apiService.getGuest<GuestModel>(
      'guestLogin',
          (json) => GuestModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
  Future<AllProductModel?> allProductData(
      String selectedItem,
      String paginate,
      String limit,
      String charLimit,
      ) async {
    final response = await apiService.getAllProducts<AllProductModel>(
      selectedItem,
      paginate,
      limit,
      charLimit,
          (json) => AllProductModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
}
