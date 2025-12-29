class AuthModel {
  String? accessToken;
  String? role;

  AuthModel({this.accessToken, this.role});

  AuthModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['data']?['accessToken'];
    role = json['data']?['role'];
  }
}
