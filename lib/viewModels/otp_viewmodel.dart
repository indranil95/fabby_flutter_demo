import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/verifyotp_model.dart';

import '../repository/otp_repository.dart';

class OtpViewModel extends ChangeNotifier {
  final OtpRepository repository;
  late bool _loading = false;

  OtpViewModel(this.repository);
  bool get loading => _loading;

  late String _error = '';
  String get error => _error;

  VerifyOtpModel? _otpData;
  VerifyOtpModel? get otpData => _otpData;
  Future<void> sendVerifyOtpRequest(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.sendVerifyOtpRequest(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _otpData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}