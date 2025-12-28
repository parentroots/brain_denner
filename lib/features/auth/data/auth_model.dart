class AuthModel {
  final String? token;
  final String? message;
  final bool? status;

  AuthModel({
    this.token,
    this.message,
    this.status,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'], // null হলেও OK
      message: json['message'],
      status: json['status'],
    );
  }
}
