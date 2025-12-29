import 'package:brain_denner/core/network/end_point/api_end_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../services/api_services/api_services.dart';
import '../../../../../../storage/storage_services.dart';

class ChangePasswordScreenController extends GetxController {
  // ================= Controllers =================
  final TextEditingController currentPasswordTEController = TextEditingController();
  final TextEditingController newPasswordTEController = TextEditingController();
  final TextEditingController confirmNewPasswordTEController = TextEditingController();

  // ================= State =================
  bool currentPasswordIsShow = false;
  bool newPasswordIsShow = false;
  bool confirmNewPasswordIsShow = false;
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

  // ================= Change Password Function =================
  // Future<void> changePasswordRepo() async {
  //
  //   isLoading = true;
  //   update();
  //
  //   Map<String, String> body = {
  //     "currentPassword":currentPasswordTEController.text,
  //     "newPassword": newPasswordTEController.text,
  //     "confirmPassword":confirmNewPasswordTEController.text,
  //   };
  //   var response = await ApiService.patch(
  //     ApiEndPoint.changePassword,
  //     body: body,
  //   );
  //
  //   if (response.statusCode == 200) {
  //
  //     currentPasswordTEController.clear();
  //     newPasswordTEController.clear();
  //     confirmNewPasswordTEController.clear();
  //
  //     Get.back();
  //   } else {
  //     Get.snackbar(response.statusCode.toString(), response.message, duration: const Duration(seconds: 1));
  //   }
  //   isLoading = false;
  //   update();
  // }


  // ================= Dispose Controllers =================
  @override
  void dispose() {
    currentPasswordTEController.dispose();
    newPasswordTEController.dispose();
    confirmNewPasswordTEController.dispose();
    super.dispose();
  }
}
