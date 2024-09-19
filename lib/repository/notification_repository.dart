
import '../models/notification_model.dart';
import '../models/pre_order_model.dart';
import '../network/api_service.dart';

class NotificationRepository{
  final ApiService apiService;

  NotificationRepository(this.apiService);

  Future<NotificationModel?> getNotification(Map<String, dynamic> requestBody) async {
    final response = await apiService.getNotificationList<NotificationModel>(
      requestBody,
          (json) => NotificationModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
}