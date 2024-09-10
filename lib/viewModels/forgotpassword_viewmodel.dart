import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/sendotp_model.dart';
import 'package:flutter_fabby_demo/repository/forgotpassword_repository.dart';



class ForgotPasswordViewModel extends ChangeNotifier {
  final ForgotPasswordRepository repository;
  late bool _loading = false;

  ForgotPasswordViewModel(this.repository);
  bool get loading => _loading;

  late String _error = '';
  String get error => _error;

  SendOtpModel? _sendOtpData;
  SendOtpModel? get sendOtpData => _sendOtpData;

  Future<void> sendOtpRequest(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.sendOtpRequest(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _sendOtpData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
