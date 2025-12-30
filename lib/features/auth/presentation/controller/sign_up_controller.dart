import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/network/end_point/api_end_point.dart';
import '../../../../services/api_services/api_response_model.dart';
import '../../../../services/api_services/api_services.dart';
import '../../data/auth_model.dart';

class SignUpController extends GetxController {
  RxBool isFirstPasswordIsShow = false.obs;
  RxBool isConfirmPasswordIsShow = false.obs;
  RxBool isLoading = false.obs; // ✅ RxBool e convert korechi

  AuthModel? authModel;
  String errorMessage = "";

  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController confirmPasswordTEController = TextEditingController();

  void firstPasswordToggle() {
    isFirstPasswordIsShow.value = !isFirstPasswordIsShow.value;
  }

  void confirmPasswordToggle() {
    isConfirmPasswordIsShow.value = !isConfirmPasswordIsShow.value;
  }

  bool _validateInputs() {
    if (nameTEController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter your name",
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return false;
    }

    if (emailTEController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter your email",
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return false;
    }

    // Email format validation
    if (!GetUtils.isEmail(emailTEController.text.trim())) {
      Get.snackbar(
        "Error",
        "Please enter a valid email address",
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return false;
    }

    if (passwordTEController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter your password",
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return false;
    }

    if (passwordTEController.text.length < 6) {
      Get.snackbar(
        "Error",
        "Password must be at least 6 characters",
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return false;
    }

    if (confirmPasswordTEController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please confirm your password",
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return false;
    }

    // Password match check
    if (passwordTEController.text != confirmPasswordTEController.text) {
      Get.snackbar(
        "Error",
        "Passwords do not match",
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return false;
    }

    return true;
  }

  //=================================Sign user===============================
  Future<void> signUp() async {
    if (!_validateInputs()) {
      return;
    }

    isLoading.value = true;

    try {
      ApiResponseModel response = await ApiService.post(
        ApiEndPoint.createUser,
        body: {
          "name": nameTEController.text.trim(),
          "email": emailTEController.text.trim(),
          "password": passwordTEController.text,
        },

      );

      print(response);

      if (response.isSuccess && (response.statusCode == 200 || response.statusCode == 201)) {


        Get.snackbar(
          "Success",
          "Account created successfully",
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
        );

        Get.toNamed(AppRoute.otpVerificationScreen, arguments: {
          'email': emailTEController.text.trim(),
        });

        clearTextField();

      } else {
        errorMessage = response.message ?? "Signup failed";
        Get.snackbar(
          "Error",
          errorMessage,
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
        );

        debugPrint('Error: $errorMessage');
      }
    } catch (e) {

      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      debugPrint('Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void clearTextField() {
    nameTEController.clear();
    emailTEController.clear();
    passwordTEController.clear();
    confirmPasswordTEController.clear();
  }

  @override
  void onClose() {
    // ✅ Shudhu onClose() e rakhchi, dispose() remove korechi
    nameTEController.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
    confirmPasswordTEController.dispose();
    super.onClose();
  }
}