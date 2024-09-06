import 'package:flutter_fabby_demo/models/blogs_detail_model.dart';
import 'package:flutter/foundation.dart';

import '../models/blogs_model.dart';
import '../network/api_service.dart';

class BlogDetailRepository {
  final ApiService apiService;

  BlogDetailRepository(this.apiService);

  // Future<BlogsDetailDataModel?> getBlogDetailRequest(Map<String, dynamic> requestBody) async {
  //   final response = await apiService.getBlogDetail<BlogsDetailDataModel>(
  //     requestBody,
  //         (json) => BlogsDetailDataModel.fromJson(json), // Adjust according to your model
  //   );
  //
  //   if (response.error != null) {
  //     throw Exception(response.error);
  //   }
  //
  //   return response.data;
  // }

  Future<BlogsDetailDataModel?> blogDetails(
      String slug,
      ) async {
    try {
      // Define the fromJson function to convert JSON to BlogsModel
      BlogsDetailDataModel fromJson(Map<String, dynamic> json) => BlogsDetailDataModel.fromJson(json);

      // Call the apiService.blogList method
      final response = await apiService.getBlogDetail(
        slug,
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
}