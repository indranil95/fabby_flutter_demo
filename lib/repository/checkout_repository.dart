import '../models/add_address_model.dart';
import '../models/cart_data_model.dart';
import '../models/checkout_model.dart';
import '../models/delete_address_model.dart';
import '../models/place_order_model.dart';
import '../network/api_service.dart';

class CheckoutRepository {
  final ApiService apiService;

  CheckoutRepository(this.apiService);
  Future<AddAddressModel?> addAddressMobile(Map<String, dynamic> requestBody) async {
    final response = await apiService.addAddressMobile<AddAddressModel>(
      requestBody,
          (json) => AddAddressModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
  Future<CheckoutModel?> checkout(Map<String, dynamic> requestBody) async {
    final response = await apiService.checkout<CheckoutModel>(
      requestBody,
          (json) => CheckoutModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
  Future<DeletedAddressModel?> deleteAddress(Map<String, dynamic> requestBody) async {
    final response = await apiService.deleteAddress<DeletedAddressModel>(
      requestBody,
          (json) => DeletedAddressModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
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
  Future<PlaceOrderModel?> placeOrder(Map<String, dynamic> requestBody) async {
    final response = await apiService.placeOrder<PlaceOrderModel>(
      requestBody,
          (json) => PlaceOrderModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
}