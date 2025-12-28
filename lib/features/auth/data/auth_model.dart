// auth_model.dart
class AuthModel {
  final String token;
  final int userId;
  final String name;
  final String email;

  AuthModel({
    required this.token,
    required this.userId,
    required this.name,
    required this.email,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'],
      userId: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
    );
  }
}
