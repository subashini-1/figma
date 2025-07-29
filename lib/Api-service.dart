import 'dart:convert';

import 'package:dio/dio.dart';

import 'Model_class.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://stellar-uat-api.letsgro.co/api/v2/login';

  Future<List<Login>> postLogin(Map<String, dynamic> requestBody) async {
    try {
      print("api call");
      final response = await _dio.post(
        baseUrl,
        data: requestBody,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        return loginFromJson(jsonEncode(response.data));
      } else {
        throw Exception('Failed to login: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('API Error: $e');
    }
  }
}
