
import '../models/pre_order_model.dart';
import '../network/api_service.dart';

class OrderHistoryRepository{
  final ApiService apiService;

  OrderHistoryRepository(this.apiService);

  Future<PreOrderModel?> getPreviousOrder(Map<String, dynamic> requestBody) async {
    final response = await apiService.getPrevOrder<PreOrderModel>(
      requestBody,
          (json) => PreOrderModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }

}