import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/all_product_model.dart';
import '../utils/logger_service.dart';
import 'base_api_service.dart';
import 'base_response.dart';

class ApiService extends BaseApiService {
  @override
  Future<BaseResponse<T>> getBanner<T>(String url, T Function(Map<String, dynamic>) fromJson) async {
    final fullUrl = Uri.parse('$baseUrl$url');
    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');

      final response = await http.get(fullUrl);

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return BaseResponse<T>(
          data: fromJson(data),
          statusCode: response.statusCode,
        );
      } else {
        return BaseResponse<T>(
          statusCode: response.statusCode,
          error: 'Error: ${response.statusCode}',
        );
      }
    } catch (e) {
      // Log the exception
      LoggerService.e('Exception: $e');
      return BaseResponse<T>(
        error: 'Exception: $e',
      );
    }
  }

  @override
  Future<BaseResponse<T>> getAllProducts<T>(
      String selectedItem,
      String paginate,
      String limit,
      String charLimit,
   T Function(Map<String, dynamic>) fromJson) async {
    final url = Uri.parse('$baseUrl/api/products/$selectedItem?paginate=$paginate&limit=$limit&charlimit=$charLimit');
    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $url');

      final response = await http.get(url);

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return BaseResponse<T>(
          data: fromJson(data),
          statusCode: response.statusCode,
        );
      } else {
        return BaseResponse<T>(
          statusCode: response.statusCode,
          error: 'Error: ${response.statusCode}',
        );
      }
    } catch (e) {
      // Log the exception
      LoggerService.e('Exception: $e');
      return BaseResponse<T>(
        error: 'Exception: $e',
      );
    }
  }

  @override
  Future<BaseResponse<T>> getGuest<T>(String url, T Function(Map<String, dynamic> p1) fromJson) async {
    final fullUrl = Uri.parse('$baseUrl$url');
    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');

      final response = await http.get(fullUrl);

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return BaseResponse<T>(
          data: fromJson(data),
          statusCode: response.statusCode,
        );
      } else {
        return BaseResponse<T>(
          statusCode: response.statusCode,
          error: 'Error: ${response.statusCode}',
        );
      }
    } catch (e) {
      // Log the exception
      LoggerService.e('Exception: $e');
      return BaseResponse<T>(
        error: 'Exception: $e',
      );
    }
  }
}

