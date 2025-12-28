class RestaurantListModel {
  bool success;
  String message;
  Pagination? pagination;
  List<Restaurant> data;

  RestaurantListModel({
    required this.success,
    required this.message,
    this.pagination,
    required this.data,
  });

  factory RestaurantListModel.fromJson(Map<String, dynamic> json) {
    return RestaurantListModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => Restaurant.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'pagination': pagination?.toJson(),
    'data': data.map((e) => e.toJson()).toList(),
  };
}

class Pagination {
  int total;
  int limit;
  int page;
  int totalPage;

  Pagination({
    required this.total,
    required this.limit,
    required this.page,
    required this.totalPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json['total'] ?? 0,
    limit: json['limit'] ?? 0,
    page: json['page'] ?? 0,
    totalPage: json['totalPage'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'total': total,
    'limit': limit,
    'page': page,
    'totalPage': totalPage,
  };
}

class Restaurant {
  String id;
  String name;
  String logo;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Restaurant({
    required this.id,
    required this.name,
    required this.logo,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json['_id'] ?? '',
    name: json['name'] ?? '',
    logo: json['logo'] ?? '',
    isDeleted: json['isDeleted'] ?? false,
    createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
    updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    v: json['__v'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'logo': logo,
    'isDeleted': isDeleted,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    '__v': v,
  };
}
