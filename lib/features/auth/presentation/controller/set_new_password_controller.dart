import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/core/network/end_point/api_end_point.dart';
import 'package:brain_denner/services/api_services/api_response_model.dart';
import 'package:brain_denner/services/api_services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SetNewPasswordController extends GetxController {
  final TextEditingController newPasswordTEController = TextEditingController();
  final TextEditingController confirmNewPasswordTEController =
      TextEditingController();

  bool isNewPasswordShow = false;
  bool isConfirmNewPasswordShow = false;

  late String refreshToken;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final args = Get.arguments;
    refreshToken = args['refreshToken'];

    debugPrint('refreshToken is here====================== $refreshToken');
  }

  void isNewPasswordShowToggle() {
    isNewPasswordShow = !isNewPasswordShow;
    update();
  }

  void isConfirmNewPasswordShowToggle() {
    isConfirmNewPasswordShow = !isConfirmNewPasswordShow;
    update();
  }

  Future<void> resetPassword() async {
    try {
      if (newPasswordTEController.text.isEmpty ||
          confirmNewPasswordTEController.text.isEmpty) {
        Get.snackbar("Error", "Please enter password");
        return;
      }

      ApiResponseModel response = await ApiService.post(
        ApiEndPoint.resetPassword,
        body: {
          'newPassword': newPasswordTEController.text,
          'confirmPassword': confirmNewPasswordTEController.text,
        },

        headers: {
          'Content-Type': "application/json",
          "Authorization": refreshToken,
        },
      );

      print("status code is ==================:${response.statusCode}");

      if (response.statusCode == 200) {
        Get.snackbar('Password Reset', 'Your Password is reset! Please login');

        newPasswordTEController.clear();
        confirmNewPasswordTEController.clear();

        Get.offAllNamed(AppRoute.signInScreen);

        debugPrint(
          'response is =====================================: ${response.data}',
        );
      } else {
        debugPrint(response.message);
      }
    } catch (e) {
      debugPrint("Exception is 😡😡😡😡😡😡😡😡😡😡😡😡😡😡😡:${e.toString()}");
    }
  }

  @override
  void onClose() {
    super.onClose();
    newPasswordTEController.dispose();
    confirmNewPasswordTEController.dispose();
  }
}
