import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/repository/member_payment_repository.dart';

import '../models/add_address_model.dart';
import '../models/customer_address_model.dart';

class MemberPaymentViewmodel extends ChangeNotifier {
  final MemberPaymentRepository repository;
  late bool _loading = false;

  MemberPaymentViewmodel(this.repository);

  bool get loading => _loading;

  late String _error = '';

  String get error => _error;

  CustomerAddressModel? _customerAddressModel;

  CustomerAddressModel? get customerAddressModel => _customerAddressModel;
  AddAddressModel? _addAddressData;

  AddAddressModel? get addAddressData => _addAddressData;

  Future<void> sendAddAddressMobileRequest(
      Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.addAddressMobile(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _addAddressData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> getCustomerAddress(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.getCustomerAddress(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _customerAddressModel = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
