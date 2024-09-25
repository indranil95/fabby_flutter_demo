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
  Future<BaseResponse<T>> removeSingleItem<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> removeMultipleItem<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> moveToWishList<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> addToCart<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> addToCartBuyNow<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> addToCartMain<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> cartData<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> getBlogDetail<T>(
      String slug, T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> getProductDetail<T>(
      String productId,String userId,String guestId, T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> moveToCart<T>(
      List<int> productIds,
      int userId,
      String guestId,
      T Function(Map<String, dynamic>) fromJson,
      );
  Future<BaseResponse<T>> moveToCartFrequently<T>(
      List<int> productIds,
      int userId,
      String guestId,
      T Function(Map<String, dynamic>) fromJson,
      );
  Future<BaseResponse<T>> checkEstimateDelivery<T>(
      String deliveryPostCode,
      T Function(Map<String, dynamic>) fromJson,
      );
  Future<BaseResponse<T>> promoCode<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> favourite<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> addAddressMobile<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> checkout<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> deleteAddress<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> getCustomerAddress<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);

  Future<BaseResponse<T>> placeOrder<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
  Future<BaseResponse<T>> getPrevOrder<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);

  Future<BaseResponse<T>> getNotificationList<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);

  Future<BaseResponse<T>> getProfile<T>(
      int userId,
      T Function(Map<String, dynamic>) fromJson,
      );
  Future<BaseResponse<T>> updateProfile<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson);
}
