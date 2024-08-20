import 'package:flutter/foundation.dart';
import 'package:flutter_fabby_demo/models/all_product_model.dart';
import 'package:flutter_fabby_demo/models/blogs_model.dart';
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
  Future<BlogsModel?> blogList(
      String paginate,
      String limit,
      String charLimit,
      ) async {
    try {
      // Define the fromJson function to convert JSON to BlogsModel
      BlogsModel fromJson(Map<String, dynamic> json) => BlogsModel.fromJson(json);

      // Call the apiService.blogList method
      final response = await apiService.blogList(
        paginate,
        limit,
        charLimit,
        fromJson,
      );

      if (response.error != null) {
        throw Exception(response.error);
      }

      return response.data;
    } catch (e) {
      // Handle any errors during the process
      if (kDebugMode) {
        print('Error: $e');
      }
      return null;
    }
  }

  Future<AllProductModel?> productsCategoryMobile(
      String selectedItem,
      ) async {
    final response = await apiService.getProductsCategoryMobile<AllProductModel>(
      selectedItem,
          (json) => AllProductModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
}
