
import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/product_detail_model.dart';
import 'package:flutter_fabby_demo/repository/product_detail_repository.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';
import 'package:flutter_fabby_demo/models/guest_model.dart' as GuestData;
import 'package:flutter_fabby_demo/models/login_model.dart'
as LoginData; // Add prefix
import '../utils/shared_prefs.dart';


class ProductDetailViewModel extends ChangeNotifier {
  final ProductDetailRepository repository;
  late bool _loading = false;

  ProductDetailViewModel(this.repository);

  bool get loading => _loading;

  late String _error = '';

  String get error => _error;

  ProductDetailModel? _productDetailModel;

  ProductDetailModel? get productDetailMode => _productDetailModel;

  Future<void> getProductDetail(String productId,String userId,String guestId) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.getProductDetail(productId,userId,guestId);

      if (response == null) {
        LoggerService.d("check:","response == null Failed to send contact us request");
        throw Exception('Failed to send contact us request');
      }

      _productDetailModel = response;
      _error = '';
    } catch (e) {
      LoggerService.d("check:","exception $e");
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
  Future<String> getMainId() async {
    String mainId = "";
    try {
      String? id;
      String loginId = "";
      final prefs = await SharedPrefsHelper.getInstance();
      LoginData.Data? loginUserData = prefs.getObject<LoginData.Data>(
        'loginUserObject',
            (Map<String, dynamic> json) => LoginData.Data.fromJson(json),
      );
      if (loginUserData != null) {
        loginId = loginUserData.id.toString();
      }
      GuestData.User? userData = prefs.getObject<GuestData.User>(
        'userObject',
            (Map<String, dynamic> json) => GuestData.User.fromJson(json),
      );
      if (userData != null) {
        id = userData.id.toString();
      }
      mainId = (id != null && id.isNotEmpty) ? id : loginId;
    } catch (e) {
      LoggerService.e('Exception: $e');
    }

    return mainId;
  }

  Future<String?> getGuestId() async {
    final prefs = await SharedPrefsHelper.getInstance();
    return prefs.getString('guestId');
  }
}
