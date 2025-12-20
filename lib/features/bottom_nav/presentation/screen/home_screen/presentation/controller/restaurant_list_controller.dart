import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../../uitls/constants/appImages/app_images.dart';
import '../../../../../../../uitls/constants/appString/app_string.dart';



class RestaurantListController extends GetxController {
  final TextEditingController searchTEController = TextEditingController();

  late int restaurantId;
  late int restaurantName;


  final PageController pageController = PageController();

  List<Map<String, dynamic>> restaurantList = [
    {'image': AppImages.stallImage, 'name': AppString.rioCafeRestaurant},
    {'image': AppImages.stallImage, 'name': AppString.durbinBanglaRestaurant},

    {'image': AppImages.stallImage, 'name': AppString.trumpCafe},

    {'image': AppImages.stallImage, 'name': AppString.aquaTowerCafe},

    {'image': AppImages.stallImage, 'name': AppString.rituVaterHotel},
  ];
}
