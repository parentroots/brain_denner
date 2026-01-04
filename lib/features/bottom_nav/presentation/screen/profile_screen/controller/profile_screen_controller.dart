import 'dart:convert';
import 'dart:io';

import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/storage/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/network/end_point/api_end_point.dart';
import '../../../../../../services/api_services/api_response_model.dart';
import '../../../../../../services/api_services/api_services.dart';
import '../../../../../../uitls/constants/appColors/app_colors.dart';
import '../data/get_profile_model.dart';

class ProfileScreenController extends GetxController {
  final ImagePicker picker = ImagePicker();
  File? file;

  var profileData = Rxn<ProfileDataModel>();

  @override
  void onInit() {
    super.onInit();
    getProfileData();
    update();
  }


  //============================get profile data==================


  Future<void> getProfileData() async {
    ApiResponseModel response = await ApiService.get(
      ApiEndPoint.getProfile,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${LocalStorage.token}',
      },
    );

    debugPrint("Profile Name: ${response.data}");

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      profileData.value = ProfileDataModel.fromJson(jsonResponse['data']);

      update();

      debugPrint("Profile Name: ${profileData.value?.name}");

    } else {
      Get.snackbar("Error", response.message ?? "Failed to load profile");
    }
  }


}
