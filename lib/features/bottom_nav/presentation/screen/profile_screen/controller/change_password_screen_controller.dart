import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/core/network/end_point/api_end_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../services/api_services/api_services.dart';
import '../../../../../../storage/storage_services.dart';

class ChangePasswordScreenController extends GetxController {
  // ================= Controllers =================
  final TextEditingController currentPasswordTEController =
      TextEditingController();
  final TextEditingController newPasswordTEController = TextEditingController();
  final TextEditingController confirmNewPasswordTEController =
      TextEditingController();

  // ================= State =================
  bool currentPasswordIsShow = true;
  bool newPasswordIsShow = true;
  bool confirmNewPasswordIsShow = true;
  bool isLoading = false;

  // ================= Toggle Password Visibility =================
  void currentPasswordToggle() {
    currentPasswordIsShow = !currentPasswordIsShow;
    update();
  }

  void newPasswordToggle() {
    newPasswordIsShow = !newPasswordIsShow;
    update();
  }

  void confirmNewPasswordToggle() {
    confirmNewPasswordIsShow = !confirmNewPasswordIsShow;
    update();
  }

  Future<void> changePassword() async {
    try {
      if (currentPasswordTEController.text.isEmpty ||
          newPasswordTEController.text.isEmpty ||
          confirmNewPasswordTEController.text.isEmpty) {
        Get.snackbar('error', 'All Field is required');
      }

      isLoading = true;
      update();

      print("Token: ${LocalStorage.token}");

      final response = await ApiService.post(
        ApiEndPoint.authChangePassword,
        body: {
          "currentPassword": currentPasswordTEController.text,
          "newPassword": newPasswordTEController.text,
          "confirmPassword": confirmNewPasswordTEController.text,
        },
        headers: {
          "Authorization": "Bearer ${LocalStorage.token}",
          "Content-Type": "application/json",
        },
      );



      print("=== API Response ===");
      print("Status Code: ${response.statusCode}");
      print("Data: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading = false;
        update();

        Get.snackbar(
          "Success",
          response.data["message"] ?? "Support created successfully",
          snackPosition: SnackPosition.BOTTOM,
        );

        Get.toNamed(AppRoute.mainBottomNavScreen);

        clearTextField();
      } else {
        isLoading = false;
        update();
        Get.snackbar(
          "Failed",
          "Status Code: ${response.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
      print("Error==============================: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  // ================= Dispose Controllers =================
  @override
  void dispose() {
    currentPasswordTEController.dispose();
    newPasswordTEController.dispose();
    confirmNewPasswordTEController.dispose();
    super.dispose();
  }

  //===============textField Clear============================

  void clearTextField() {
    currentPasswordTEController.clear();
    newPasswordTEController.clear();
    confirmNewPasswordTEController.clear();
  }
}
