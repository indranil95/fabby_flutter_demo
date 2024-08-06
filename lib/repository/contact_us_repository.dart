import 'package:flutter_fabby_demo/models/contactus_model.dart';

import '../network/api_service.dart';

class ContactUsRepository {
  final ApiService apiService;

  ContactUsRepository(this.apiService);

  Future<ContactUsModel?> sendContactUsRequest(Map<String, dynamic> requestBody) async {
    final response = await apiService.contactUs<ContactUsModel>(
      requestBody,
          (json) => ContactUsModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }

}