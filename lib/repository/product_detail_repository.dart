import 'package:flutter_fabby_demo/models/check_estimate_delivery_model.dart';
import 'package:flutter_fabby_demo/models/favourite_model.dart';

import '../models/add_to_cart_model.dart';
import '../models/product_detail_model.dart';
import '../network/api_service.dart';

class ProductDetailRepository{
  final ApiService apiService;

  ProductDetailRepository(this.apiService);

  Future<ProductDetailModel?> getProductDetail(String productId,String userId,String guestId) async {
    final response = await apiService.getProductDetail<ProductDetailModel>(
      productId,
      userId,
      guestId,
          (json) => ProductDetailModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
  Future<AddToCartModel?> addToCart(Map<String, dynamic> requestBody) async {
    final response = await apiService.addToCart<AddToCartModel>(
      requestBody,
          (json) => AddToCartModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
  Future<AddToCartModel?> addToCartBuyNow(Map<String, dynamic> requestBody) async {
    final response = await apiService.addToCartBuyNow<AddToCartModel>(
      requestBody,
          (json) => AddToCartModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
  Future<FavouriteModel?> favourite(Map<String, dynamic> requestBody) async {
    final response = await apiService.favourite<FavouriteModel>(
      requestBody,
          (json) => FavouriteModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
  Future<CheckEstimateDeliveryModel?> checkEstimateDelivery(
      String deliveryPostCode,
      ) async {
    final response = await apiService.checkEstimateDelivery<CheckEstimateDeliveryModel>(
      deliveryPostCode,

          (json) => CheckEstimateDeliveryModel.fromJson(json),
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }

}