import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/core/network/end_point/api_end_point.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/home_screen/presentation/data/recent_check_model.dart';
import 'package:brain_denner/services/api_services/api_response_model.dart';
import 'package:brain_denner/services/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../storage/storage_services.dart';

class HomeScreenController extends GetxController {
  final TextEditingController searchTEController = TextEditingController();

  List<HistoryData> recentFoods = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyRecentFood();
  }

  void onTapShowRestaurantButton() {
    Get.toNamed(AppRoute.restaurantListScreen);
  }

  List<String> recentChecked = [];

  Future<void> getMyRecentFood() async {
    try {
      ApiResponseModel response = await ApiService.get(
        ApiEndPoint.getHistory,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${LocalStorage.token}",
        },
      );
      debugPrint('Recent Check data is ==========================>:${response.data}');

      if (response.statusCode == 200) {
        final history = HistoryResponse.fromJson(response.data);
        recentFoods = history.data;
        update();
        debugPrint('Response  data is ==========================>:${response.data}');
      } else {
        debugPrint("Failed to fetch history: ${response.message}");
      }
    } catch (e) {
      debugPrint("Error is ==================================>:$e");
    }
  }

  @override
  void onClose() {
    searchTEController.dispose();
    super.onClose();
  }
}
