
import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/all_product_model.dart';
import 'package:flutter_fabby_demo/repository/product_list_repository.dart';

import '../AppConstant/app_constant.dart';

class ProductlistViewmodel extends ChangeNotifier {
  final ProductListRepository repository;
  AllProductModel? _allProductData;
  late bool _loading = false;

  ProductlistViewmodel(this.repository);
  bool get loading => _loading;

  late String _error = '';
  String get error => _error;

  AllProductModel? _productListData;
  AllProductModel? get productListData => _productListData;



  // Future<void> getProductsRequest(String searchOrSelect, String paginate, String limit, String charLimit) async {
  //   _loading = true;
  //   notifyListeners();
  //
  //   try {
  //     final response = await repository.ProductsData(searchOrSelect, paginate, limit, charLimit);
  //
  //     if (response == null) {
  //       throw Exception('Failed to send contact us request');
  //     }
  //
  //     _productListData = response;
  //     _error = '';
  //   } catch (e) {
  //     _error = e.toString();
  //   } finally {
  //     _loading = false;
  //     notifyListeners();
  //   }
  // }

  Future<void> loadProducts(String searchOrSort,
      ) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.ProductsData(searchOrSort, AppConstants.productPaginate,"Yes", AppConstants.charLimit);

      _allProductData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}