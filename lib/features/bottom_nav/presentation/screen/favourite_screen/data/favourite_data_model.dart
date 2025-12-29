class FavouriteDataModel {
  bool? success;
  String? message;
  Pagination? pagination;
  List<Data>? data;

  FavouriteDataModel({this.success, this.message, this.pagination, this.data});

  FavouriteDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = total;
    data['limit'] = limit;
    data['page'] = page;
    data['totalPage'] = totalPage;
    return data;
  }
}

class Data {
  String? sId;
  String? user;
  Food? food;
  String? createdAt;
  bool? isFavourite;
  String? note;
  String? updatedAt;

  Data(
      {this.sId,
        this.user,
        this.food,
        this.createdAt,
        this.isFavourite,
        this.note,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    food = json['food'] != null ? Food.fromJson(json['food']) : null;
    createdAt = json['createdAt'];
    isFavourite = json['isFavourite'];
    note = json['note'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['user'] = user;
    if (food != null) {
      data['food'] = food!.toJson();
    }
    data['createdAt'] = createdAt;
    data['isFavourite'] = isFavourite;
    data['note'] = note;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Food {
  String? sId;
  String? name;
  String? category;

  Food({this.sId, this.name, this.category});

  Food.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['category'] = category;
    return data;
  }
}
