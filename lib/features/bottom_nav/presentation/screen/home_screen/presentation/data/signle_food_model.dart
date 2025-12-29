class FoodResponseModel {
  bool? success;
  String? message;
  NutritionFoodDataModel? data;

  FoodResponseModel({this.success, this.message, this.data});

  factory FoodResponseModel.fromJson(Map<String, dynamic> json) {
    return FoodResponseModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? NutritionFoodDataModel.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class NutritionFoodDataModel {
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
  int? v;

  NutritionFoodDataModel({
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
    this.v,
  });

  factory NutritionFoodDataModel.fromJson(Map<String, dynamic> json) {
    return NutritionFoodDataModel(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
      restaurant: json['restaurant'] != null
          ? Restaurant.fromJson(json['restaurant'])
          : null,
      impactSpeed: json['impactSpeed'],
      digestionSpeed: json['digestionSpeed'],
      spike: json['spike'],
      fact: json['fact'],
      reason: json['reason'],
      absorption: json['absorption'],
      description: json['description'],
      typicalServing: json['typicalServing'] != null
          ? TypicalServing.fromJson(json['typicalServing'])
          : null,
      isDeleted: json['isDeleted'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'category': category,
      'restaurant': restaurant?.toJson(),
      'impactSpeed': impactSpeed,
      'digestionSpeed': digestionSpeed,
      'spike': spike,
      'fact': fact,
      'reason': reason,
      'absorption': absorption,
      'description': description,
      'typicalServing': typicalServing?.toJson(),
      'isDeleted': isDeleted,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class Restaurant {
  String? id;
  String? name;
  String? logo;

  Restaurant({this.id, this.name, this.logo});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['_id'],
      name: json['name'],
      logo: json['logo'],
    );
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

  factory TypicalServing.fromJson(Map<String, dynamic> json) {
    return TypicalServing(
      carbs: json['carbs'],
      protein: json['protein'],
      fat: json['fat'],
      fiber: json['fiber'],
    );
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
