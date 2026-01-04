import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/core/network/end_point/api_end_point.dart';
import 'package:brain_denner/storage/storage_keys.dart';
import 'package:brain_denner/storage/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/api_services/api_response_model.dart';
import '../../../../services/api_services/api_services.dart';
import '../../data/auth_model.dart';

class SignInController extends GetxController {

  ///------------------ STATE ------------------
  RxBool isLoading = false.obs;
  AuthModel? authModel;
  String errorMessage = "";


  ///------------------ CONTROLLERS ------------------

  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();

  bool isShowPassword = true;

  ///------------------ UI LOGIC ------------------

  void isPasswordToggle() {
    isShowPassword = !isShowPassword;
    update();
  }

  ///------------------ LOGIN METHOD ------------------


  Future<void> signInUser() async {


    if (emailTEController.text.trim().isEmpty ||
        passwordTEController.text.trim().isEmpty) {
      Get.snackbar("Warning", "All fields are required");
      return;
    }

    isLoading.value = true;
    update();

    try {
      final Map<String, String> body = {
        "email": emailTEController.text.trim(),
        "password": passwordTEController.text.trim(),
      };

      ApiResponseModel response = await ApiService.post(
        ApiEndPoint.login,
        body: body,
      );

      if (response.statusCode == 200 || response.isSuccess) {

        final data = response.data;

        // Save token
        LocalStorage.token = data['data']['accessToken'];
        LocalStorage.isLogIn = true;

        await LocalStorage.setBool(
          LocalStorageKeys.isLogIn,
          true,
        );
        await LocalStorage.setString(
          LocalStorageKeys.token,
          LocalStorage.token,
        );

        debugPrint("Access Token: ${LocalStorage.token}");

        Get.snackbar("Success", "Login Successful");

        emailTEController.clear();
        passwordTEController.clear();

        // Clear stack and go home
        Get.offAllNamed(AppRoute.mainBottomNavScreen);

      } else {
        Get.snackbar(
          "Login Failed",
          response.data?['message'] ?? "Invalid credentials",
        );
      }

    } catch (e) {
      debugPrint("Login Error: $e");
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
      update();
    }
  }

  ///------------------ CLEANUP ------------------

  @override
  void onClose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    super.onClose();
  }


}
