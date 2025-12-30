import 'dart:convert';

import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/core/network/end_point/api_end_point.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/home_screen/presentation/data/restaurant_list_model.dart';
import 'package:brain_denner/services/api_services/api_response_model.dart';
import 'package:brain_denner/services/api_services/api_services.dart';
import 'package:brain_denner/storage/storage_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../../uitls/constants/appImages/app_images.dart';
import '../../../../../../../uitls/constants/appString/app_string.dart';
import '../../../favourite_screen/data/favourite_data_model.dart';



class RestaurantListController extends GetxController {
  final TextEditingController searchTEController = TextEditingController();

  late int restaurantId;
  late int restaurantName;


  final PageController pageController = PageController();


  List<Restaurant>restaurantList=[];



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllRestaurantList();
  }


  Future<void> getAllRestaurantList() async {
    try {
      var response = await ApiService.get(
          ApiEndPoint.getAllRestaurantList,
        headers: {
          "Content-Type": "application/json",
          "Authorization":"Bearer ${LocalStorage.token}"
        }

      );


      print("status code💕💕💕💕${response.statusCode}");
      print("message code💕💕💕💕${response.message}");
      print("status code💕💕💕💕${LocalStorage.token}");

      if (response.statusCode == 200) {
        final jsonResponse = response.data;

        if (jsonResponse != null && jsonResponse['data'] != null) {

          List<dynamic> jsonData = jsonResponse['data'];
          restaurantList = jsonData.map((e) => Restaurant.fromJson(e)).toList();
          update();
          print(jsonResponse);

        }
      } else {
        Get.snackbar("Error", response.message ?? "Failed to load restaurants");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }



  
  
  
  
  
}
