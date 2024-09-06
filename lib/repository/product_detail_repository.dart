import '../models/product_detail_model.dart';
import '../network/api_service.dart';

class ProductDetailRepository{
  final ApiService apiService;

  ProductDetailRepository(this.apiService);

  Future<ProductDetailModel?> getProductDetail(String productId,String userId,String guestId) async {
    final response = await apiService.getProductDetail<ProductDetailModel>(
      productId,
      userId,
      guestId,
          (json) => ProductDetailModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }

}