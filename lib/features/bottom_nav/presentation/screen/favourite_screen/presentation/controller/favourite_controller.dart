import 'dart:convert';

import 'package:brain_denner/core/network/end_point/api_end_point.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/favourite_screen/data/favourite_data_model.dart';
import 'package:brain_denner/services/api_services/api_response_model.dart';
import 'package:brain_denner/services/api_services/api_services.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {





  List<Data > favouriteList = [];

  Future<void> getFavouriteList() async {

    ApiResponseModel response =
    await ApiService.get(ApiEndPoint.getFavourite);

    if (response.statusCode == 200) {


      Map<String, dynamic> jsonResponse = response.data;

      List<dynamic> jsonData = jsonResponse['data'] ?? [];

      favouriteList = jsonData.map((e) => Data.fromJson(e)).toList();

      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getFavouriteList();

    //
  }
}

  
  
  
