import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/login_model.dart';
import 'package:flutter_fabby_demo/repository/login_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginRepository repository;
  late bool _loading = false;

  LoginViewModel(this.repository);
  bool get loading => _loading;

  late String _error = '';
  String get error => _error;

  LoginModel? _loginData;
  LoginModel? get loginData => _loginData;
  Future<void> sendLoginRequest(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.sendLoginRequest(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _loginData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}