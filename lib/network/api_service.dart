import 'dart:convert';

import 'package:flutter_fabby_demo/models/blogs_model.dart';
import 'package:http/http.dart' as http;

import '../models/profile_model.dart';
import '../utils/logger_service.dart';
import '../utils/shared_prefs.dart';
import 'base_api_service.dart';
import 'base_response.dart';

class ApiService extends BaseApiService {
  late final String token ;

  ApiService() {
    _initToken();
  }
  Future<void> _initToken() async {
    token = await getAccessToken() ?? ''; // Provide a default value if null
  }
  Future<String?> getAccessToken() async {
    final prefs = await SharedPrefsHelper.getInstance();
    return prefs.getString('accessToken');
  }

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
  Future<BaseResponse<T>> getProducts<T>(
      String searchOrSort,
      String paginate,
      String limit,
      String charLimit,
      T Function(Map<String, dynamic>) fromJson) async {
    final String endpoint = "products/$searchOrSort";
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

      final response = await http.post(fullUrl);

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
  Future<BaseResponse<T>> getProductDetail<T>(
      String productId,String userId,String guestId, T Function(Map<String, dynamic>) fromJson) async {
    final url = "singleProductDetails/$productId/$userId";
    final fullUrl = Uri.parse('$baseUrl$url').replace(queryParameters: {'guestId': guestId}); // Add query parameters
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
  Future<BaseResponse<T>> removeSingleItem<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "addToCart";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json','Authorization': 'Bearer $token',},
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
  Future<BaseResponse<T>> removeMultipleItem<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "addToCart";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json','Authorization': 'Bearer $token',},
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
  Future<BaseResponse<T>> moveToWishList<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "movetowishlist";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json','Authorization': 'Bearer $token',},
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
  Future<BaseResponse<T>> addToCartBuyNow<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "addToCart";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json','Authorization': 'Bearer $token',},
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
  Future<BaseResponse<T>> addToCartMain<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "addToCart";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json','Authorization': 'Bearer $token',},
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
  Future<BaseResponse<T>> cartData<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "cartData";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');
      LoggerService.i('Request header: token: $token');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json','Authorization': 'Bearer $token',},
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
  @override
  Future<BaseResponse<T>> moveToCartFrequently<T>(
      List<int> productIds,
      int userId,
      String guestId,
      T Function(Map<String, dynamic>) fromJson
      ) async {
    const String endpoint = "moveToCartFrequently";
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
  @override
  Future<BaseResponse<T>> checkEstimateDelivery<T>(
      String deliveryPostCode,
      T Function(Map<String, dynamic>) fromJson
      ) async {
    const String endpoint = "checkEstimateDelivery";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and parameters
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: delivery_postcode: $deliveryPostCode');

      // Convert productIds to the correct format for the API request
      final body = <String, String>{};
      body['delivery_postcode'] = deliveryPostCode;

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
  @override
  Future<BaseResponse<T>> promoCode<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "promocode";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json','Authorization': 'Bearer $token',},
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
  Future<BaseResponse<T>> favourite<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "favorite";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json',},
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
  Future<BaseResponse<T>> addAddressMobile<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "addAddressMobile";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json','Authorization': 'Bearer $token',},
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
  Future<BaseResponse<T>> checkout<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "checkout";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json','Authorization': 'Bearer $token',},
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
  Future<BaseResponse<T>> deleteAddress<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "deleteaddress";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json','Authorization': 'Bearer $token',},
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
  Future<BaseResponse<T>> getCustomerAddress<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "getCustomerAddress";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json','Authorization': 'Bearer $token',},
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
  Future<BaseResponse<T>> placeOrder<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "placeOrder";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json','Authorization': 'Bearer $token',},
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
  Future<BaseResponse<T>> getPrevOrder<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "prevOrderWebMobile";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxNSIsImp0aSI6IjFmZTdmZTVmMzE5YTE5NTMxOGUwMmI0N2ZhMDNlNGE0MjU4N2NkMzQwNzU2Y2ExOTdlYzczNjY1MTM1Yjc0YTBmMDJiOTMwOWM4M2U2MGY5IiwiaWF0IjoxNzI0OTI5MTg2LCJuYmYiOjE3MjQ5MjkxODYsImV4cCI6MTc1NjQ2NTE4Niwic3ViIjoiNDkiLCJzY29wZXMiOltdfQ.AufdmMwKb4nxf6hQsU8GILP4XYVzy37lF7vGPogOP6l0qdtqJMODhZGFxPe2J3KiR-PmOlgf-zmmy_NauEPn5xaEqJgdmx4ktjjtwh6XlICsiSjQsS8trYBs88kb5Md9MT7f8UTB25HwBM6TCMLfla3o1qMrc2pGRCf_TAH3i3XxhIGR8P5F3NtCvVeqWTh5-NEKQ0DGONFLQx89E9AjuMVfKsF-e5dCWt5SP31dnn-bzcgX6Um5hzqOIMqf8mVFbzwSD3ASrL78Xy9ajlMXU7CcapTMf-u9b-Hit_gLjeCjA4jl7kM3M_QJcrPobLp_3rLIhv6SlR-GjGVeG0rY6yj367A-ORLE8nw0w5b_Lvn0oRr61YJ1KfkCyz4Qu5pU9jhqAmW8Mv9JcYVM7V1cOL-4_YoPO_4qj3P5UgFvYtw8pBk0V9xGai-MmtHoOL-NYLqTawrhVCWf69frkD-6q3NRDJ_jdR2BKUogddip489ByeeJywtIRZI3uPAdRQzbqzRot9b1175zvCcZC3sh2dIWNQrlH6e1ZlxaJXG11Zov7nJ4V4xemXL1o85iVGHoYPJpNbY1hKShDrpxOsAf24hxzD0iW0lJ96e0BHZhW9oLre5vmhC89pJ7D6d-PtQu7JLvlGkSvDlUS3xZuB1PiBJ8ufAP5cJ-TKwderKvjfA', // Add the Bearer token here
      };

      final response = await http.post(
        fullUrl,
        headers: headers,
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
  Future<BaseResponse<T>> getNotificationList<T>(Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "notificatiolistWeb";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'};

      final response = await http.post(
        fullUrl,
        headers: headers,
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
  Future<BaseResponse<T>> getProfile<T>(
      int userId,
      T Function(Map<String, dynamic>) fromJson
      ) async {
    const String endpoint = "getProfile";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and parameters
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: user_id: $userId');

      // Prepare the body of the request
      final body = {'user_id': userId.toString()};

      // Prepare the headers including the Bearer token
      final headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $token',
      };

      // Send the request
      final response = await http.post(
        fullUrl,
        headers: headers,
        body: body,
      );

      // Log the response status code and body
      LoggerService.i('Response Status Code: ${response.statusCode}');
      LoggerService.i('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        // Parse the response body
        final data = json.decode(response.body) as Map<String, dynamic>;
        return BaseResponse<T>(
          data: fromJson(data),
          statusCode: response.statusCode,
        );
      } else {
        // Handle error responses
        return BaseResponse<T>(
          statusCode: response.statusCode,
          error: 'Error: ${response.statusCode}',
        );
      }
    } catch (e) {
      // Log any exceptions that occur
      LoggerService.e('Exception: $e');
      return BaseResponse<T>(
        error: 'Exception: $e',
      );
    }
  }

  @override
  Future<BaseResponse<T>> updateProfile<T>(
      Map<String, dynamic> requestBody,
      T Function(Map<String, dynamic> p1) fromJson) async {
    const String endpoint = "updateProfile";
    final fullUrl = Uri.parse('$baseUrl$endpoint');

    try {
      // Log the request URL and method
      LoggerService.i('Request URL: $fullUrl');
      LoggerService.i('Request Body: ${json.encode(requestBody)}');

      final response = await http.post(
        fullUrl,
        headers: {'Content-Type': 'application/json','Authorization': 'Bearer $token',},
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
}
