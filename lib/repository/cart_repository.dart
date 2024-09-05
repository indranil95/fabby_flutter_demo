import 'package:flutter_fabby_demo/models/add_to_cart_model.dart';
import 'package:flutter_fabby_demo/models/cart_data_model.dart';
import 'package:flutter_fabby_demo/models/move_to_wishlist_model.dart';
import 'package:flutter_fabby_demo/models/remove_single_item_model.dart';

import '../models/remove_multiple_item_model.dart';
import '../network/api_service.dart';

class CartRepository {
  final ApiService apiService;

  CartRepository(this.apiService);

  Future<CartDataModel?> cartData(Map<String, dynamic> requestBody) async {
    final response = await apiService.cartData<CartDataModel>(
      requestBody,
      (json) => CartDataModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
  Future<RemoveSingleItemModel?> removeSingleItem(Map<String, dynamic> requestBody) async {
    final response = await apiService.removeSingleItem<RemoveSingleItemModel>(
      requestBody,
      (json) => RemoveSingleItemModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
  Future<AddToCartModel?> addToCartMain(Map<String, dynamic> requestBody) async {
    final response = await apiService.addToCartMain<AddToCartModel>(
      requestBody,
      (json) => AddToCartModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
  Future<MoveToWishListModel?> moveToWishList(Map<String, dynamic> requestBody) async {
    final response = await apiService.moveToWishList<MoveToWishListModel>(
      requestBody,
      (json) => MoveToWishListModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
  Future<RemoveMultipleItemModel?> removeMultipleItem(Map<String, dynamic> requestBody) async {
    final response = await apiService.removeSingleItem<RemoveMultipleItemModel>(
      requestBody,
      (json) => RemoveMultipleItemModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
}
