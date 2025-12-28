// api_response_model.dart
class ApiResponseModel {
  final int statusCode;
  final dynamic data;
  final String? message;
  final bool isSuccess;

  ApiResponseModel({
    required this.statusCode,
    this.data,
    this.message,
    required this.isSuccess,
  });

  factory ApiResponseModel.success(int statusCode, dynamic data) {
    return ApiResponseModel(
      statusCode: statusCode,
      data: data,
      isSuccess: true,
    );
  }

  factory ApiResponseModel.error(int statusCode, String message) {
    return ApiResponseModel(
      statusCode: statusCode,
      message: message,
      isSuccess: false,
    );
  }
}
