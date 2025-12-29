class FoodListModel {
  bool? success;
  String? message;
  Pagination? pagination;
  List<FoodData>? data;

  FoodListModel({this.success, this.message, this.pagination, this.data});

  FoodListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <FoodData>[];
      json['data'].forEach((v) {
        data!.add(FoodData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['success'] = success;
    json['message'] = message;
    if (pagination != null) {
      json['pagination'] = pagination!.toJson();
    }
    if (data != null) {
      json['data'] = data!.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class Pagination {
  int? total;
  int? limit;
  int? page;
  int? totalPage;

  Pagination({this.total, this.limit, this.page, this.totalPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    limit = json['limit'];
    page = json['page'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'limit': limit,
      'page': page,
      'totalPage': totalPage,
    };
  }
}

class FoodData {
  String? id;
  String? name;
  String? category;
  Restaurant? restaurant;
  String? impactSpeed;
  String? digestionSpeed;
  String? spike;
  String? fact;
  String? reason;
  String? absorption;
  String? description;
  TypicalServing? typicalServing;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  FoodData({
    this.id,
    this.name,
    this.category,
    this.restaurant,
    this.impactSpeed,
    this.digestionSpeed,
    this.spike,
    this.fact,
    this.reason,
    this.absorption,
    this.description,
    this.typicalServing,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  FoodData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    category = json['category'];
    restaurant = json['restaurant'] != null
        ? Restaurant.fromJson(json['restaurant'])
        : null;
    impactSpeed = json['impactSpeed'];
    digestionSpeed = json['digestionSpeed'];
    spike = json['spike'];
    fact = json['fact'];
    reason = json['reason'];
    absorption = json['absorption'];
    description = json['description'];
    typicalServing = json['typicalServing'] != null
        ? TypicalServing.fromJson(json['typicalServing'])
        : null;
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['_id'] = id;
    json['name'] = name;
    json['category'] = category;
    if (restaurant != null) {
      json['restaurant'] = restaurant!.toJson();
    }
    json['impactSpeed'] = impactSpeed;
    json['digestionSpeed'] = digestionSpeed;
    json['spike'] = spike;
    json['fact'] = fact;
    json['reason'] = reason;
    json['absorption'] = absorption;
    json['description'] = description;
    if (typicalServing != null) {
      json['typicalServing'] = typicalServing!.toJson();
    }
    json['isDeleted'] = isDeleted;
    json['createdAt'] = createdAt;
    json['updatedAt'] = updatedAt;
    return json;
  }
}

class Restaurant {
  String? id;
  String? name;
  String? logo;

  Restaurant({this.id, this.name, this.logo});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'logo': logo,
    };
  }
}

class TypicalServing {
  int? carbs;
  int? protein;
  int? fat;
  int? fiber;

  TypicalServing({this.carbs, this.protein, this.fat, this.fiber});

  TypicalServing.fromJson(Map<String, dynamic> json) {
    carbs = json['carbs'];
    protein = json['protein'];
    fat = json['fat'];
    fiber = json['fiber'];
  }

  Map<String, dynamic> toJson() {
    return {
      'carbs': carbs,
      'protein': protein,
      'fat': fat,
      'fiber': fiber,
    };
  }
}
