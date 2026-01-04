import 'dart:convert';
import 'dart:io';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/profile_screen_controller.dart';
import 'package:brain_denner/services/api_services/api_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/network/end_point/api_end_point.dart';
import '../../../../../../services/api_services/api_services.dart';
import '../../../../../../storage/storage_services.dart';
import '../data/get_profile_model.dart';

class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  String name=LocalStorage.myName;

  File? file;
  bool isLoading = false;
  var profileData = Rxn<ProfileDataModel>();

  @override
  void onInit() {
    super.onInit();
    getProfileData();
  }

  // ---------------- Pick Image ----------------
  void pickImage() async {
    try {
      final XFile? photo = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 70,
      );

      if (photo == null) return;

      String ext = photo.path.split('.').last.toLowerCase();
      List<String> allowed = ['jpg', 'jpeg', 'png'];

      if (!allowed.contains(ext)) {
        Get.snackbar(
          "Error",
          "Only JPG and PNG images are supported",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      file = File(photo.path);
      update();
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // ---------------- Get image to show ----------------
  ImageProvider? get profileImage {
    if (file != null) return FileImage(file!);
    if (profileData.value?.image != null &&
        profileData.value!.image!.isNotEmpty) {
      return NetworkImage(ApiEndPoint.imageUrl + profileData.value!.image!);
    }
    return null;
  }

  // ---------------- Update Profile ----------------
  Future<void> editProfileUpdate() async {
    try {
      if (nameController.text.trim().isEmpty && file == null) {
        Get.snackbar(
          "Error",
          "Please update name or profile image",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      isLoading = true;
      update();

      ApiResponseModel response;

      if (file != null) {
        response = await ApiService.multipart(
          ApiEndPoint.updateProfile,
          method: "PATCH",
          file: file!,
          fileKey: "image",
          fields: {
            if (nameController.text.trim().isNotEmpty)
              "name": nameController.text.trim(),
          },
          headers: {
            "Authorization": "Bearer ${LocalStorage.token}",
          },
        );
      } else {
        response = await ApiService.patch(
          ApiEndPoint.updateProfile,
          body: {"name": nameController.text.trim()},
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${LocalStorage.token}",
          },
        );
      }

      isLoading = false;
      update();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];
        Get.back();

        LocalStorage.myName = data["name"] ?? LocalStorage.myName;
        LocalStorage.myImage = data["image"] ?? LocalStorage.myImage;

        Get.snackbar(
          "Success",
          "Profile updated successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        nameController.clear();
        file = null;

        // Auto refresh profile screen
        if (Get.isRegistered<ProfileScreenController>()) {
          Get.find<ProfileScreenController>().getProfileData();
        }
      } else {
        Get.snackbar(
          "Failed",
          response.message ?? "Update failed",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      isLoading = false;
      update();
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // ---------------- Fetch Profile ----------------
  Future<void> getProfileData() async {
    ApiResponseModel response = await ApiService.get(
      ApiEndPoint.getProfile,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${LocalStorage.token}',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      profileData.value = ProfileDataModel.fromJson(jsonResponse['data']);
      update();
    } else {
      Get.snackbar("Error", response.message ?? "Failed to load profile");
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
