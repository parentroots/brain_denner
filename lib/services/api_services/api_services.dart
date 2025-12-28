// api_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'api_response_model.dart';

class ApiService {
  static const String baseUrl = "https://your-api-base-url.com";

  static Map<String, String> defaultHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };


  // ================= GET =================

  static Future<ApiResponseModel> get(String endpoint, {Map<String, String>? headers,}) async {

    try {
      final response = await http.get(
        Uri.parse(baseUrl + endpoint),
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
        Uri.parse(baseUrl + endpoint),
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
        Uri.parse(baseUrl + endpoint),
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
        Uri.parse(baseUrl + endpoint),
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
        Uri.parse(baseUrl + endpoint),
        headers: headers ?? defaultHeaders,
      );
      return _processResponse(response);
    } catch (e) {
      return ApiResponseModel.error(500, e.toString());
    }
  }

  // ================= MULTIPART =================

  static Future<ApiResponseModel> multipart(String endpoint, {required File file, required String fileKey, Map<String, String>? fields, Map<String, String>? headers,}) async {
    try {
      final request = http.MultipartRequest(
        "POST",
        Uri.parse(baseUrl + endpoint),
      );

      request.headers.addAll(headers ?? {});
      if (fields != null) request.fields.addAll(fields);

      request.files.add(
        await http.MultipartFile.fromPath(fileKey, file.path),
      );

      final streamedResponse = await request.send();
      final response =
      await http.Response.fromStream(streamedResponse);

      return _processResponse(response);
    } catch (e) {
      return ApiResponseModel.error(500, e.toString());
    }
  }



  // ================= RESPONSE HANDLER =================
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
