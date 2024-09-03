import 'dart:convert';

import 'package:flutter_fabby_demo/models/blogs_model.dart';
import 'package:http/http.dart' as http;

import '../utils/logger_service.dart';
import 'base_api_service.dart';
import 'base_response.dart';

class ApiService extends BaseApiService {
  @override
  Future<BaseResponse<T>> getBanner<T>(
      String url, T Function(Map<String, dynamic>) fromJson) async {
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
    final String endpoint = "products/$selectedItem";
    //check
    final url = Uri.parse(
        '$baseUrl$endpoint?paginate=$paginate&limit=$limit&charlimit=$charLimit');
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
  Future<BaseResponse<T>> getProductsCategoryMobile<T>(
      String selectedItem, T Function(Map<String, dynamic> p1) fromJson) async {
    final String endpoint = "products_categoryMobile/$selectedItem";
    //check
    final url = Uri.parse('$baseUrl$endpoint');
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
  Future<BaseResponse<T>> getGuest<T>(
      String url, T Function(Map<String, dynamic> p1) fromJson) async {
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
  Future<BaseResponse<T>> contactUs<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic>) fromJson) async {
    const String endpoint = "contact_us";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
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
  Future<BaseResponse<T>> blogList<T>(String paginate, String limit,
      String charLimit, T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "articles/news";
    //check
    final url = Uri.parse(
        '$baseUrl$endpoint?paginate=$paginate&limit=$limit&charlimit=$charLimit');
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

  // Future<BlogsDetailDataModel> fetchBlogData() async {
  //   final response = await http.get(Uri.parse('your_api_url'));
  //
  //   if (response.statusCode == 200) {
  //     return BlogsDetailDataModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load blog data');
  //   }
  // }

  Future<List<BlogsModel>> fetchBlogs() async {
    final response = await http.get(Uri.parse('your_api_url'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => BlogsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }

  @override
  Future<BaseResponse<T>> getBlogDetail<T>(
      String slug, T Function(Map<String, dynamic>) fromJson) async {
    final url = "blog_details/news/$slug";
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
  Future<BaseResponse<T>> login<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "loginMobile";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
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
  Future<BaseResponse<T>> signUp<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "signupMobile";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
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
  Future<BaseResponse<T>> verifyOtpMobile<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "verifyOtpMobile";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
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
  Future<BaseResponse<T>> sendOtp<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "sendOtp";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
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
  Future<BaseResponse<T>> passwordReset<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "password_reset";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
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
  Future<BaseResponse<T>> wishList<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "wishlist";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
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
  Future<BaseResponse<T>> removeWishItem<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "removewishiteam";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
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
  Future<BaseResponse<T>> removeWishItemMultiple<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "removewishiteam";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
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
  Future<BaseResponse<T>> addToCart<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "addToCart";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
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
  Future<BaseResponse<T>> moveToCart<T>(
      List<int> productIds,
      int userId,
      String guestId,
      T Function(Map<String, dynamic>) fromJson
      ) async {
    const String endpoint = "moveToCart";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and parameters
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: product_ids: $productIds, userid: $userId, guestid: $guestId');

      // Convert productIds to the correct format for the API request
      final body = <String, String>{};
      for (int i = 0; i < productIds.length; i++) {
        body['product_ids[$i]'] = productIds[i].toString(); // Use indexed keys for array values
      }
      body['userid'] = userId.toString();
      body['guestid'] = guestId;

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: body,
      );

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
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
