import 'dart:io';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/services/api_services/api_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/network/end_point/api_end_point.dart';
import '../../../../../../services/api_services/api_services.dart';
import '../../../../../../storage/storage_services.dart';

class EditProfileController extends GetxController {
  // ---------------- Controllers ----------------
  TextEditingController nameController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  // ---------------- State ----------------
  File? file;
  bool isLoading = false;

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

  // ---------------- Update Profile ----------------
  Future<void> editProfileUpdate() async {
    try {
      /// 🔒 At least one change required
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
      }

      // 🔥 Case 2: Only name update
      else {
        response = await ApiService.patch(
          ApiEndPoint.updateProfile,
          body:
          {
            "name": nameController.text.trim(),
          },
          headers: {
            "Content-Type":"application/json",
            "Authorization": "Bearer ${LocalStorage.token}",
          },
        );
      }

      isLoading = false;
      update();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];

        // 🔐 Update local storage safely
        LocalStorage.myName = data["name"] ?? LocalStorage.myName;
        LocalStorage.myImage = data["image"] ?? LocalStorage.myImage;

        Get.snackbar(
          "Success",
          "Profile updated successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Clear state
        nameController.clear();
        file = null;

        Get.offNamed(AppRoute.mainBottomNavScreen);
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

  // ---------------- Dispose ----------------

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
