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

  void showCustomLogoutDialog() {
    Get.dialog(
      Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: Get.width * 0.8,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.logout, size: 48, color: Colors.red),
                const SizedBox(height: 12),
                const Text(
                  "Logout",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Are you sure you want to Log-Out ?",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const AppText(
                          text: 'Cancel',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                        ),
                        onPressed: () async {
                          await LocalStorage.removeAllPrefData();
                          Get.offAllNamed(AppRoute.signInScreen);
                        },
                        child: const AppText(
                          text: 'Log Out',
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
