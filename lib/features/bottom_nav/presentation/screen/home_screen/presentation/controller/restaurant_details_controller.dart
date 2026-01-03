import 'dart:convert';

import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/network/end_point/api_end_point.dart';
import '../../../../../../../services/api_services/api_response_model.dart';
import '../../../../../../../services/api_services/api_services.dart';
import '../../../favourite_screen/data/favourite_data_model.dart';
import '../data/food_category_model.dart';

class RestaurantDetailsController extends GetxController {
  late int id;
  late String restaurantName;

  int currentIndex = 0;

  final TextEditingController searchTEController = TextEditingController();
  final TextEditingController dialogNoteTEController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    restaurantName = Get.arguments["name"];
    fetchAllFoods();
  }

  void onTapItem(int index) {
    currentIndex = index;
    update();
  }
  List<FoodData> allFoodList = [];
  List<FoodData> breakFastFoodList = [];
  List<FoodData> lunchFoodList = [];
  List<FoodData> dinnerFoodList = [];
  List<FoodData> snackFoodList = [];






  Future<void> fetchAllFoods() async {
    update();
    try {
      ApiResponseModel response = await ApiService.get(ApiEndPoint.getAllFood);

      if (response.statusCode == 200) {

        Map<String, dynamic> jsonResponse = response.data;

        List<dynamic> jsonData = jsonResponse['data'];



        List<FoodData> allFoods =
        jsonData.map((e) => FoodData.fromJson(e)).toList();

        // Clear previous lists


        breakFastFoodList.clear();
        lunchFoodList.clear();
        dinnerFoodList.clear();
        snackFoodList.clear();


        for (var food in allFoods) {
          switch (food.category?.toLowerCase()) {
            case 'breakfast':
              breakFastFoodList.add(food);
              break;
            case 'lunch':
              lunchFoodList.add(food);
              break;
            case 'dinner':
              dinnerFoodList.add(food);
              break;
            case 'snack':
              snackFoodList.add(food);
              break;
          }
        }

        update();
      } else {
        Get.snackbar(
          "Error",
          response.message ?? "Failed to fetch foods",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
      debugPrint("Fetch foods exception: $e");
    } finally {
      update();
    }
  }


  Future<void> addFavourite({required String foodId, String? note,}) async {

    try {
      ApiResponseModel response = await ApiService.post(
        ApiEndPoint.createFavourite,
        body: {
          "food": foodId,
          "note": note ?? "",
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          "Success",
          response.data?['message'] ?? "Added to favourite",
        );
      } else {
        Get.snackbar(
          "Error",
          response.message ?? "Failed to add favourite",
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      debugPrint('error is================ :${e.toString()}');
    } finally {
      update();
    }
  }








  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchTEController.dispose();
    dialogNoteTEController.dispose();
  }
}
