// api_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:brain_denner/storage/storage_services.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:http/http.dart' as http;
import 'api_response_model.dart';

class ApiService {
 // static const String baseUrl = "http://10.10.7.7:5005/api/v1";

  static Map<String, String> defaultHeaders = {
    "Content-Type": "application/json",
    "Authorization":"Bearer ${LocalStorage.token}"
  };


  // ================= GET =================

  static Future<ApiResponseModel> get(String endpoint, {Map<String, String>? headers,}) async {

    try {
      final response = await http.get(
        Uri.parse( endpoint),
        headers: headers ?? defaultHeaders,
      );
      return _processResponse(response);
    } catch (e) {

      return ApiResponseModel.error(500, e.toString());

    }

  }

  // ================= POST =================
  static Future<ApiResponseModel> post(String endpoint, {Map<String, String>? headers, Map<String, dynamic>? body,}) async {
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: headers ?? defaultHeaders,
        body: jsonEncode(body),
      );
      return _processResponse(response);
    } catch (e) {
      return ApiResponseModel.error(500, e.toString());
    }

  }



  // ================= PUT =================
  static Future<ApiResponseModel> put(String endpoint, {Map<String, String>? headers, Map<String, dynamic>? body,}) async {
    try {
      final response = await http.put(
        Uri.parse(endpoint),
        headers: headers ?? defaultHeaders,
        body: jsonEncode(body),
      );
      return _processResponse(response);
    } catch (e) {
      return ApiResponseModel.error(500, e.toString());
    }
  }

  // ================= PATCH =================

  static Future<ApiResponseModel> patch(String endpoint, {Map<String, String>? headers, Map<String, dynamic>? body,}) async {
    try {
      final response = await http.patch(
        Uri.parse( endpoint),
        headers: headers ?? defaultHeaders,
        body: jsonEncode(body),
      );
      return _processResponse(response);
    } catch (e) {
      return ApiResponseModel.error(500, e.toString());
    }
  }


  // ================= DELETE =================

  static Future<ApiResponseModel> delete(String endpoint, {Map<String, String>? headers,}) async {
    try {
      final response = await http.delete(
        Uri.parse( endpoint),
        headers: headers ?? defaultHeaders,
      );
      return _processResponse(response);
    } catch (e) {
      return ApiResponseModel.error(500, e.toString());
    }
  }



  static Future<ApiResponseModel> multipartPatch(
      String url, {
        Map<String, String>? header,
        Map<String, String>? body,
        String method = "PATCH",
        String imageName = 'image',
        String? imagePath,
        bool skipAuth = false,
      }) async {
    try {
      final request = http.MultipartRequest(
        method,
        Uri.parse(url),
      );

      final Map<String, String> finalHeaders = header ?? {};
      if (!skipAuth && LocalStorage.token != null) {
        finalHeaders["Authorization"] = "Bearer ${LocalStorage.token}";
      }
      request.headers.addAll(finalHeaders);

      // ===== Image =====
      if (imagePath != null && imagePath.isNotEmpty) {
        request.files.add(
          await http.MultipartFile.fromPath(
            imageName,
            imagePath,
          ),
        );
      }

      // ===== Text fields =====
      if (body != null) {
        request.fields.addAll(body);
      }

      // ===== Send Request =====
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return _processResponse(response);
    } catch (e) {
      return ApiResponseModel.error(500, e.toString());
    }
  }

  static Future<ApiResponseModel> multipart(
      String endpoint, {
        required File file,
        required String fileKey,
        Map<String, String>? fields,
        Map<String, String>? headers,
        String method = "PATCH",
      }) async {
    try {
      final request = http.MultipartRequest(
        method,
        Uri.parse(endpoint),
      );

      if (headers != null) {
        request.headers.addAll(headers);
      }

      if (fields != null) {
        request.fields.addAll(fields);
      }

      request.files.add(
        await http.MultipartFile.fromPath(fileKey, file.path),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return _processResponse(response);
    } catch (e) {
      return ApiResponseModel.error(500, e.toString());
    }
  }
  static ApiResponseModel _processResponse(http.Response response) {
    try {
      final data = jsonDecode(response.body);
      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        return ApiResponseModel.success(
            response.statusCode, data);
      } else {
        return ApiResponseModel.error(
          response.statusCode,
          data['message'] ?? "Something went wrong",
        );
      }
    } catch (_) {
      return ApiResponseModel.error(
        response.statusCode,
        "Invalid response format",
      );
    }
  }
}
