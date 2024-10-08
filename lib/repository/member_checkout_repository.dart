import 'package:flutter_fabby_demo/models/add_address_model.dart';
import 'package:flutter_fabby_demo/models/checkout_model.dart';
import 'package:flutter_fabby_demo/models/customer_address_model.dart';
import 'package:flutter_fabby_demo/models/delete_address_model.dart';
import 'package:flutter_fabby_demo/models/verifyotp_model.dart';

import '../models/cart_data_model.dart';
import '../network/api_service.dart';

class MemberCheckoutRepository{
  final ApiService apiService;

  MemberCheckoutRepository(this.apiService);

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
  Future<CustomerAddressModel?> getCustomerAddress(Map<String, dynamic> requestBody) async {
    final response = await apiService.getCustomerAddress<CustomerAddressModel>(
      requestBody,
          (json) => CustomerAddressModel.fromJson(json), // Adjust according to your model
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

}