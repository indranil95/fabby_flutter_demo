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

}