import 'package:flutter_fabby_demo/models/add_address_model.dart';
import 'package:flutter_fabby_demo/models/verifyotp_model.dart';

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

}