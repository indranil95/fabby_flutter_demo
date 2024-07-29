import 'base_response.dart';

abstract class BaseApiService {
  final String baseUrl = "https://uat.admin.fabbyfurever.com/api/";

  Future<BaseResponse<T>> getBanner<T>(String url, T Function(Map<String, dynamic>) fromJson);
}
