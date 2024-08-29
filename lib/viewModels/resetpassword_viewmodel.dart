import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/resetpassword_model.dart';
import '../repository/resetpassword_repository.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  final ResetPasswordRepository repository;
  late bool _loading = false;

  ResetPasswordViewModel(this.repository);
  bool get loading => _loading;

  late String _error = '';
  String get error => _error;

  ResetPasswordModel? _passwordData;
  ResetPasswordModel? get passwordData => _passwordData;
  Future<void> passwordReset(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.passwordReset(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _passwordData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}