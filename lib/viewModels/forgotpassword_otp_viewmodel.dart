import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/verifyotp_model.dart';

import '../repository/forgotpassword_otp_repository.dart';

class ForgotPasswordOtpViewModel extends ChangeNotifier {
  final ForgotPasswordOtpRepository repository;
  late bool _loading = false;

  ForgotPasswordOtpViewModel(this.repository);
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