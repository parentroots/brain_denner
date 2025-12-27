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
    {'image': AppImages.stallImage, 'name': AppString.mealIntake},
    {'image': AppImages.stallImage, 'name': AppString.wendys},

    {'image': AppImages.stallImage, 'name': AppString.tacobell},

    {'image': AppImages.stallImage, 'name': AppString.zaxby},

    {'image': AppImages.stallImage, 'name': AppString.popeye},
  ];
}
