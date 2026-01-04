
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/network/end_point/api_end_point.dart';
import '../../../../../../../services/api_services/api_response_model.dart';
import '../../../../../../../services/api_services/api_services.dart';
import '../../../../../../../storage/storage_services.dart';

import '../data/food_category_model.dart';

class RestaurantDetailsController extends GetxController {
  late String id;
  late String restaurantName;

  int currentIndex = 0;

  final TextEditingController searchTEController = TextEditingController();
  final TextEditingController dialogNoteTEController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    restaurantName = Get.arguments["name"];
    id = Get.arguments["id"].toString();

    searchTEController.addListener(onSearchTextChanged);

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


  // filtered list
  List<FoodData> filteredBreakFast = [];
  List<FoodData> filteredLunch = [];
  List<FoodData> filteredDinner = [];
  List<FoodData> filteredSnack = [];




  void onSearchTextChanged() {
    String query = searchTEController.text.toLowerCase();

    filteredBreakFast = breakFastFoodList
        .where((food) => food.name!.toLowerCase().contains(query))
        .toList();

    filteredLunch = lunchFoodList
        .where((food) => food.name!.toLowerCase().contains(query))
        .toList();

    filteredDinner = dinnerFoodList
        .where((food) => food.name!.toLowerCase().contains(query))
        .toList();

    filteredSnack = snackFoodList
        .where((food) => food.name!.toLowerCase().contains(query))
        .toList();

    update();
  }




  Future<void> fetchAllFoods() async {
    update();
    try {
      ApiResponseModel response = await ApiService.get(
        "${ApiEndPoint.getAllFood}?restaurant=$id",
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${LocalStorage.token}",
        },
      );

      if (response.statusCode == 200) {

        Map<String, dynamic> jsonResponse = response.data;

        List<dynamic> jsonData = jsonResponse['data'];



        List<FoodData> allFoods =
        jsonData.map((e) => FoodData.fromJson(e)).toList();



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


        // init filtered list

        filteredBreakFast = List.from(breakFastFoodList);
        filteredLunch = List.from(lunchFoodList);
        filteredDinner = List.from(dinnerFoodList);
        filteredSnack = List.from(snackFoodList);



        update();
      } else {
        Get.snackbar(
          "Error",
          response.message ?? "Failed to fetch foods",
          snackPosition: SnackPosition.BOTTOM,
        );

        debugPrint('Error is ==============================>:${response.message}');
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


  Future<void>createHistory({required String foodId})async{

    try{
      ApiResponseModel response =await ApiService.post(ApiEndPoint.createHistory,
          headers: {
            "Content-Type": "application/json",
            "Authorization":"Bearer ${LocalStorage.token}"
          },
      body: {
        'food':foodId
      }

      );

      if(response.statusCode==200||response.statusCode==201){
        debugPrint("History create successful=================>:${response.message}");
      }else{
        debugPrint("History create Failed=================>:${response.message}");

      }

    }catch(e){
        debugPrint("Error is ===============================>:${e.toString()}");
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
