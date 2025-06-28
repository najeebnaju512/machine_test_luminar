import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:developer';

import 'package:machine_test_luminar/app_config/app_config.dart';


/// Enum to define the HTTP request type
enum ApiCase {
  post,
  put,
  patch,
}

/// Common API response model
class ApiResponse {
  final int status;
  final String msg;
  final dynamic data;

  ApiResponse({required this.status, required this.msg, required this.data});
}

/// Centralized API helper using Dio
class ApiHelper {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.baseurl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      contentType: 'application/json',
      responseType: ResponseType.json,
    ),
  );

  /// Generate appropriate headers
  static Map<String, String> getApiHeader({String? access, String? dbName}) {
    if (access != null) {
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $access',
      };
    } else if (dbName != null) {
      return {
        'Content-Type': 'application/json',
        'dbName': dbName,
      };
    } else {
      return {
        'Content-Type': 'application/json',
      };
    }
  }

  /// GET request handler
  static Future<ApiResponse> getData({
    required String endPoint,
    Map<String, String>? header,
  }) async {
    log("ApiHelper -> GET: $endPoint");

    try {
      final response = await _dio.get(
        endPoint,
        options: Options(headers: header),
      );

      log("Status: ${response.statusCode}");

      return ApiResponse(
        status: response.statusCode ?? 500,
        msg: "Success",
        data: response.data,
      );
    } on DioException catch (e) {
      log("GET Error: ${e.message}");
      return ApiResponse(
        status: e.response?.statusCode ?? 500,
        msg: e.message ?? 'Unknown error',
        data: e.response?.data,
      );
    }
  }

  /// POST/PUT/PATCH request handler
  static Future<ApiResponse> postData({
    required String endPoint,
    required Map<String, dynamic> body,
    required Map<String, String> header,
    ApiCase method = ApiCase.post,
    bool isMultipart = false,
  }) async {
    log("ApiHelper -> ${method.name.toUpperCase()}: $endPoint");
    log("isMultipart: $isMultipart");

    try {
      final dataToSend = isMultipart
          ? FormData.fromMap(
              body.map((key, value) => MapEntry(key, value.toString())),
            )
          : jsonEncode(body);

      Response response;

      switch (method) {
        case ApiCase.post:
          response = await _dio.post(
            endPoint,
            data: dataToSend,
            options: Options(headers: header),
          );
          break;
        case ApiCase.put:
          response = await _dio.put(
            endPoint,
            data: dataToSend,
            options: Options(headers: header),
          );
          break;
        case ApiCase.patch:
          response = await _dio.patch(
            endPoint,
            data: dataToSend,
            options: Options(headers: header),
          );
          break;
      }

      log("Status: ${response.statusCode}");

      return ApiResponse(
        status: response.statusCode ?? 500,
        msg: "Success",
        data: response.data,
      );
    } on DioException catch (e) {
      log("API Error (${method.name}): ${e.message})   ($e)");
      return ApiResponse(
        status: e.response?.statusCode ?? 500,
        msg: e.message ?? 'Unknown error',
        data: e.response?.data,
      );
    }
  }
}
