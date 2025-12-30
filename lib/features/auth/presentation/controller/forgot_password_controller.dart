import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/services/api_services/api_response_model.dart';
import 'package:brain_denner/services/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/network/end_point/api_end_point.dart';

class ForgotPasswordController extends GetxController {
  RxBool isLoading = false.obs;

  final TextEditingController forgotEmailTEController = TextEditingController();

  bool _validateEmail() {
    if (forgotEmailTEController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter your email",
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (!GetUtils.isEmail(forgotEmailTEController.text.trim())) {
      Get.snackbar(
        "Error",
        "Please enter a valid email address",
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    return true;
  }

  // ✅ Send OTP
  Future<void> sendOtp() async {
    if (!_validateEmail()) {
      return;
    }

    isLoading.value = true;

    try {
      ApiResponseModel response = await ApiService.post(
        ApiEndPoint.forgotPassword,
        body: {
          'email': forgotEmailTEController.text.trim(),
        },
      );



      if (response.isSuccess &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        Get.snackbar(
          "Success",
          "OTP sent to your email",
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );


        Get.toNamed(AppRoute.otpVerifyForgotpassword, arguments: {
          'email': forgotEmailTEController.text.trim(),
          "type": "forgot_password",


        });

        print("📤 Email sent to OTP screen: ${forgotEmailTEController.toString()}");
      } else {
        String errorMessage =
            response.data?['message'] ?? response.message ?? "Failed to send OTP";

        Get.snackbar(
          'Error',
          errorMessage,
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );

        debugPrint("Error: $errorMessage");
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      debugPrint("Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    forgotEmailTEController.dispose();
    super.onClose();
  }
}