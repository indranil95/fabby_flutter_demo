import '../models/guest_model.dart';
import '../network/api_service.dart';

class StartRepository{
  final ApiService apiService;

  StartRepository(this.apiService);

  Future<GuestModel?> guestData() async {
    final response = await apiService.getGuest<GuestModel>(
      'guestLogin',
          (json) => GuestModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }

}