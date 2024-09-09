
import '../models/all_product_model.dart';
import '../network/api_service.dart';

class ProductListRepository {
  final ApiService apiService;

  ProductListRepository(this.apiService);

  Future<AllProductModel?> ProductsData(
      String searchOrSelect,
      String paginate,
      String limit,
      String charLimit,
      ) async {
    final response = await apiService.getProducts<AllProductModel>(
      searchOrSelect,
      paginate,
      limit,
      charLimit,
          (json) => AllProductModel.fromJson(json), // Adjust according to your model
    );

    if (response.error != null) {
      throw Exception(response.error);
    }

    return response.data;
  }
}