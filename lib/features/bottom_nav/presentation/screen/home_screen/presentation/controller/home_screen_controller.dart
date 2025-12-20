import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  final TextEditingController searchTEController=TextEditingController();

  void onTapShowRestaurantButton(){

    Get.toNamed(AppRoute.restaurantListScreen);
  }

}