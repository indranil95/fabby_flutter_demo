import 'package:flutter_fabby_demo/models/removeitem_model.dart';
import 'package:flutter_fabby_demo/models/wishlist_model.dart';

import '../network/api_service.dart';

class WishlistRepository{
  final ApiService apiService;

  WishlistRepository(this.apiService);

  Future<WishListModel?> wishlist(Map<String, dynamic> requestBody) async {
    final response = await apiService.wishList<WishListModel>(
      requestBody,
          (json) => WishListModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
  Future<RemoveItemModel?> removeWishItem(Map<String, dynamic> requestBody) async {
    final response = await apiService.removeWishItem<RemoveItemModel>(
      requestBody,
          (json) => RemoveItemModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
  Future<RemoveItemModel?> removeWishItemMultiple(Map<String, dynamic> requestBody) async {
    final response = await apiService.removeWishItemMultiple<RemoveItemModel>(
      requestBody,
          (json) => RemoveItemModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
  Future<RemoveItemModel?> addToCart(Map<String, dynamic> requestBody) async {
    final response = await apiService.addToCart<RemoveItemModel>(
      requestBody,
          (json) => RemoveItemModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }

}