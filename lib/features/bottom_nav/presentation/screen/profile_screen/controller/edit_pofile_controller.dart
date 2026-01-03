import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/network/end_point/api_end_point.dart';
import '../../../../../../services/api_services/api_services.dart';
import '../../../../../../storage/storage_services.dart';

class EditPofileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  File? file;
  bool isLoading = false;

  void pickImage() async {
    final XFile? photo = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 70,
    );
    if (photo != null) {
      file = File(photo.path);
      update();
    }
  }

  Future<void> editProfileMultipartUpdate() async {
    try {
      // Validation
      if (nameController.text.trim().isEmpty) {
        Get.snackbar("Error", "Name is required");
        return;
      }

      if (file == null) {
        Get.snackbar("Error", "Please select an image");
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
        method: "PATCH", // ← backend যা নেয় তাই দাও
      );

      isLoading = false;
      update();

      // Response handle
      if (response.statusCode == 200 || response.statusCode == 201) {
        // ✅ Success - storage এ save করো
        final data = response.data['data'];
        LocalStorage.myName = data["name"] ?? "";
        LocalStorage.myImage = data["image"] ?? "";

        Get.snackbar("Success", "Profile updated successfully");
        Get.back(); // Previous screen এ ফিরে যাও
      } else {
        Get.snackbar("Failed", response.message ?? "Update failed");
      }
    } catch (e) {
      isLoading = false;
      update();
      Get.snackbar("Error", e.toString());
      debugPrint("🔥 Error: $e");
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}