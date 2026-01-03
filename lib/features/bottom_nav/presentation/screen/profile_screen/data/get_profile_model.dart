class ProfileModel {
  bool success;
  String message;
  ProfileDataModel data;

  ProfileModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: ProfileDataModel.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class ProfileDataModel {
  String id;
  String name;
  String role;
  String email;
  String image;
  dynamic subscription;
  String status;
  bool isVerified;
  bool isDeleted;
  String createdAt;
  String updatedAt;
  int v;

  ProfileDataModel({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.image,
    this.subscription,
    required this.status,
    required this.isVerified,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) {
    return ProfileDataModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      subscription: json['subscription'],
      status: json['status'] ?? '',
      isVerified: json['isVerified'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'role': role,
      'email': email,
      'image': image,
      'subscription': subscription,
      'status': status,
      'isVerified': isVerified,
      'isDeleted': isDeleted,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}
