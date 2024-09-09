import 'base_response.dart';

abstract class BaseApiService {
  final String baseUrl = "https://uat.admin.fabbyfurever.com/api/";

  Future<BaseResponse<T>> getBanner<T>(
      String url, T Function(Map<String, dynamic>) fromJson);

  Future<BaseResponse<T>> getGuest<T>(
      String url, T Function(Map<String, dynamic>) fromJson);

  Future<BaseResponse<T>> getAllProducts<T>(
      String selectedItem,
      String paginate,
      String limit,
      String charLimit,
      T Function(Map<String, dynamic>) fromJson);

  Future<BaseResponse<T>> getProducts<T>(
      String searchOrSort,
      String paginate,
      String limit,
      String charLimit,
      T Function(Map<String, dynamic>) fromJson);

  Future<BaseResponse<T>> blogList<T>(String paginate, String limit,
      String charLimit, T Function(Map<String, dynamic>) fromJson);

  Future<BaseResponse<T>> getProductsCategoryMobile<T>(
      String selectedItem, T Function(Map<String, dynamic>) fromJson);

  Future<BaseResponse<T>> contactUs<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> login<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> signUp<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> verifyOtpMobile<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> sendOtp<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> passwordReset<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> wishList<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> removeWishItem<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> removeWishItemMultiple<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> addToCart<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> getBlogDetail<T>(
      String slug, T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> moveToCart<T>(
      List<int> productIds,
      int userId,
      String guestId,
      T Function(Map<String, dynamic>) fromJson,
      );
}
