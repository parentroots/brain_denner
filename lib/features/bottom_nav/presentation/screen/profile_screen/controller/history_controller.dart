import 'package:get/get.dart';
import 'package:brain_denner/services/api_services/api_services.dart';
import 'package:brain_denner/core/network/end_point/api_end_point.dart';
import 'package:brain_denner/storage/storage_services.dart';

class HistoryController extends GetxController {
  List<HistoryItem> historyList = [];
  bool isLoading = false;

  Future<void> getallhistory() async {
    try {
      isLoading = true;
      update();

      var response = await ApiService.get(
        ApiEndPoint.getMyHistory,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${LocalStorage.token}"
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = response.data;

        if (jsonResponse != null && jsonResponse['data'] != null) {
          List<dynamic> jsonData = jsonResponse['data'];
          historyList = jsonData.map((e) => HistoryItem.fromJson(e)).toList();
          print('History loaded: ${historyList.length} items');
        }
      } else {
        Get.snackbar("Error", response.message ?? "Failed to load history");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print('Error in getallhistory: $e');
    } finally {
      isLoading = false;
      update();
    }
  }
}


class HistoryItem {
  String? id;
  String? userId;
  Food? food;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  HistoryItem({
    this.id,
    this.userId,
    this.food,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      id: json['_id'],
      userId: json['user'],
      food: json['food'] != null ? Food.fromJson(json['food']) : null,
      isDeleted: json['isDeleted'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Food {
  String? id;
  String? name;

  Food({
    this.id,
    this.name,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['_id'],
      name: json['name'],
    );
  }
}