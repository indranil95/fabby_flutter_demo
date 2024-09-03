import 'package:flutter_fabby_demo/models/move_to_cart_model.dart';
import 'package:flutter_fabby_demo/models/removeitem_model.dart';
import 'package:flutter_fabby_demo/models/wishlist_model.dart';

import '../models/add_to_cart_model.dart';
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
  Future<MoveToCartModel?> moveToCart(
      List<int> productIds,
      int userId,
      String guestId
      ) async {
    final response = await apiService.moveToCart<MoveToCartModel>(
      productIds,
      userId,
      guestId,
          (json) => MoveToCartModel.fromJson(json),
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }



}