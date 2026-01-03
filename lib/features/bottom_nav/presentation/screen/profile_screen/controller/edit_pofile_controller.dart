import 'dart:convert';
import 'dart:io';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
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
  File? file;
  bool isLoading = false;
  





  void pickImage() async {
    try {
      final XFile? photo = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 70,
      );

      if (photo != null) {
        // Debug logs to check what we're getting
        debugPrint("📸 Photo name: ${photo.name}");
        debugPrint("📸 Photo path: ${photo.path}");
        debugPrint("📸 Photo mimeType: ${photo.mimeType}");

        // Extract extension from path (more reliable than name)
        String ext = photo.path.split('.').last.toLowerCase().trim();
        debugPrint("📸 Extracted extension: $ext");

        // List of allowed extensions
        List<String> allowedExtensions = ['jpg', 'jpeg', 'png'];

        if (!allowedExtensions.contains(ext)) {
          Get.snackbar(
            "Error",
            "Only JPEG and PNG images are supported",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          debugPrint("❌ Invalid file extension: $ext");
          return;
        }

        file = File(photo.path);
        debugPrint("✅ Image selected successfully: ${photo.path}");
        update();
      } else {
        debugPrint("⚠️ No image selected");
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to pick image: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      debugPrint("🔥 Error picking image: $e");
    }
  }

  Future<void> editProfileMultipartUpdate() async {
    try {
      // Validation
      if (nameController.text.trim().isEmpty) {
        Get.snackbar(
          "Error",
          "Please Enter Your Name",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      if (file == null) {
        Get.snackbar(
          "Error",
          "Please select a profile image",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      isLoading = true;
      update();

      final response = await ApiService.multipart(
        ApiEndPoint.updateProfile,
        file: file!,
        fileKey: "image",
        fields: {
          "name": nameController.text.trim(),
        },
        headers: {
          "Authorization": "Bearer ${LocalStorage.token}",
        },
        method: "PATCH",
      );

      isLoading = false;
      update();

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          final data = response.data['data'];
          LocalStorage.myName = data["name"] ?? "";
          LocalStorage.myImage = data["image"] ?? "";

          Get.snackbar(
            "Success",
            "Profile updated successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

          // Reset controllers
          nameController.clear();

          Get.toNamed(AppRoute.mainBottomNavScreen);
          file = null;
          update();

          Get.back();
        } catch (e) {
          debugPrint("🔥 Error parsing response: $e");
          Get.snackbar(
            "Error",
            "Failed to parse response data",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          "Failed",
          response.message ?? "Update failed",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        debugPrint("❌ Update failed: ${response.message}");
      }
    } catch (e) {
      isLoading = false;
      update();
      Get.snackbar(
        "Error",
        "Error: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      debugPrint("🔥 Error: $e");
    }
  }
  


  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}