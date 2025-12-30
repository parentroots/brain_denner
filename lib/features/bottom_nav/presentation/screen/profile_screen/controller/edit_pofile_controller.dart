
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/network/end_point/api_end_point.dart';
import '../../../../../../services/api_services/api_services.dart';
import '../../../../../../storage/storage_services.dart';

class EditPofileController extends GetxController {

  TextEditingController nameController = TextEditingController();


  Future<void> editProfileUpdate() async {
    try {
      if (nameController.text.trim().isEmpty) {
        Get.snackbar("Error", "Name is required");
        return;
      }

      final body = {
        "name": nameController.text.trim(),
      };

      final response = await ApiService.post(
        ApiEndPoint.updateProfile,
        body: body,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${LocalStorage.token}",
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success", "Profile updated successfully");
      } else {
        Get.snackbar("Failed", response.message ?? "Update failed");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {

    }
  }






  final ImagePicker picker = ImagePicker();
  File? file;

  void pickImage() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      file = File(photo.path);
      update();
    }
  }
}
