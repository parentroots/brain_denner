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
      'carbs': '',
      'protein': '',
      'fat': '',
    },

    {
      'title': 'Burrito',
      'icon': AppImages.burrito,
      'carbs': '',
      'protein': '',
      'fat': ' ',
    },

    {
      'title': 'Chicken sandwich',
      'icon': AppImages.nuggets,
      'carbs': ' ',
      'protein': ' ',
      'fat': ' ',
    },

    {
      'title': 'Fries',
      'icon': AppImages.chicken,
      'carbs': ' ',
      'protein': ' ',
      'fat': ' ',
    },
  ];
  List<Map<String, dynamic>> launchFoodList = [
    {
      'title': 'Fries',
      'icon': AppImages.fries,
      'carbs': ' ',
      'protein': ' ',
      'fat': ' ',
    },
  ];

  List<Map<String, dynamic>> dinnerFoodList = [
    {
      'title': 'Fries',
      'icon': AppImages.fries,
      'carbs': ' ',
      'protein': '',
      'fat': ' ',
    },

    {
      'title': 'Burrito',
      'icon': AppImages.burrito,
      'carbs': '',
      'protein': '',
      'fat': '',
    },
  ];
  List<Map<String, dynamic>> snackFoodList = [
    {
      'title': 'Fries',
      'icon': AppImages.fries,
      'carbs': '',
      'protein': ' ',
      'fat': '',
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
