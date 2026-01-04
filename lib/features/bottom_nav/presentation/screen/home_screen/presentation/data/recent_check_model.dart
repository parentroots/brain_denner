class HistoryResponse {
  bool success;
  String message;
  Pagination pagination;
  List<HistoryData> data;

  HistoryResponse({
    required this.success,
    required this.message,
    required this.pagination,
    required this.data,
  });

  factory HistoryResponse.fromJson(Map<String, dynamic> json) {
    return HistoryResponse(
      success: json['success'],
      message: json['message'],
      pagination: Pagination.fromJson(json['pagination']),
      data: (json['data'] as List)
          .map((e) => HistoryData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'pagination': pagination.toJson(),
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
    total: json['total'],
    limit: json['limit'],
    page: json['page'],
    totalPage: json['totalPage'],
  );

  Map<String, dynamic> toJson() => {
    'total': total,
    'limit': limit,
    'page': page,
    'totalPage': totalPage,
  };
}

class HistoryData {
  String id;
  String user;
  Food food;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;

  HistoryData({
    required this.id,
    required this.user,
    required this.food,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HistoryData.fromJson(Map<String, dynamic> json) => HistoryData(
    id: json['_id'],
    user: json['user'],
    food: Food.fromJson(json['food']),
    isDeleted: json['isDeleted'],
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'user': user,
    'food': food.toJson(),
    'isDeleted': isDeleted,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}

class Food {
  String id;
  String name;

  Food({
    required this.id,
    required this.name,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json['_id'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
  };
}
