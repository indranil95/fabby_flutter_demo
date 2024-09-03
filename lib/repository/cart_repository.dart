import 'package:flutter_fabby_demo/models/cart_data_model.dart';

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
}
