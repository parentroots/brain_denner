class AuthModel {
  String? accessToken;
  String? role;
  String? userId;
  String? name;
  String? email;

  AuthModel({this.accessToken, this.role, this.userId, this.name, this.email});

  AuthModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['data']?['accessToken'];
    role = json['data']?['role'];
    userId = json['data']?['userId'];
    name = json['data']?['name'];
    email = json['data']?['email'];
  }
}
