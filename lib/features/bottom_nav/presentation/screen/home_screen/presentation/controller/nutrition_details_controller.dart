import 'dart:convert';
import 'package:get/get.dart';
import '../../../../../../../core/network/end_point/api_end_point.dart';
import '../../../../../../../services/api_services/api_response_model.dart';
import '../../../../../../../services/api_services/api_services.dart';
import '../data/signle_food_model.dart';

class NutritionDetailsController extends GetxController{
  bool isLoading = false;
  NutritionFoodDataModel? nutritionDetailsData;
  String errorMessage = "";

  late String foodId;

  @override
  void onInit() {
    super.onInit();
    foodId = Get.arguments['foodId'] ?? '';
    getSingleFoodNutritionDetails();
  }

  Future<void> getSingleFoodNutritionDetails() async {
    if (foodId.isEmpty) return;

    isLoading = true;
    update();

    try {
      ApiResponseModel response = await ApiService.get("${ApiEndPoint.getSingleFood}$foodId");

      if(response.statusCode == 200){


        Map<String, dynamic> jsonResponse = response.data;


        if(jsonResponse['data'] != null){
          nutritionDetailsData = NutritionFoodDataModel.fromJson(jsonResponse['data']);
        }
      } else {
        errorMessage = response.message ?? "Failed to fetch food details";
      }
    } catch (e) {
      errorMessage = e.toString();
      print("Fetch foods exception: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

}
