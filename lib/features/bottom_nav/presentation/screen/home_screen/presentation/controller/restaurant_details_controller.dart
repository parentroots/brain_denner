import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  }

  void onTapItem(int index) {
    currentIndex = index;
    update();
  }

  List<Map<String, dynamic>> breakFastFoodList = [
    {
      'title': 'Fries',
      'icon': AppImages.fries,
      'carbs': '150 ',
      'protein': '120 ',
      'fat': '0 ',
    },

    {
      'title': 'Burrito',
      'icon': AppImages.burrito,
      'carbs': '15',
      'protein': '200 ',
      'fat': '14 ',
    },

    {
      'title': 'Chicken sandwich',
      'icon': AppImages.nuggets,
      'carbs': '15 ',
      'protein': '150 ',
      'fat': '140 ',
    },

    {
      'title': 'Fries',
      'icon': AppImages.chicken,
      'carbs': '150 ',
      'protein': '150 ',
      'fat': '150 ',
    },
  ];
  List<Map<String, dynamic>> launchFoodList = [
    {
      'title': 'Fries',
      'icon': AppImages.fries,
      'carbs': '150 ',
      'protein': '150 ',
      'fat': '150 ',
    },
  ];

  List<Map<String, dynamic>> dinnerFoodList = [
    {
      'title': 'Fries',
      'icon': AppImages.fries,
      'carbs': '150 ',
      'protein': '150',
      'fat': '150 ',
    },

    {
      'title': 'Burrito',
      'icon': AppImages.burrito,
      'carbs': '150',
      'protein': '150 ',
      'fat': '150 fat',
    },
  ];
  List<Map<String, dynamic>> snackFoodList = [
    {
      'title': 'Fries',
      'icon': AppImages.fries,
      'carbs': '150 ',
      'protein': '150 ',
      'fat': '150 ',
    },
  ];


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchTEController.dispose();
    dialogNoteTEController.dispose();
  }
}
