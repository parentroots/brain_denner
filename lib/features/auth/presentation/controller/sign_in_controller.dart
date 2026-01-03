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
  RxBool isLoading = false.obs;
  AuthModel? authModel;
  String errorMessage = "";

  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();

  bool isShowPassword = true;

  void isPasswordToggle() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
  }

  Future<void> signInUser() async {
    try {
      Map<String, String> body = {
        "email": emailTEController.text,
        "password": passwordTEController.text,
      };

      ApiResponseModel response = await ApiService.post(
        ApiEndPoint.login,
        body: body,
      );

      if (response.statusCode == 200 || response.isSuccess) {
        var data = response.data;

        LocalStorage.token = data['data']["accessToken"];

        LocalStorage.isLogIn = true;

        LocalStorage.setBool(LocalStorageKeys.isLogIn, LocalStorage.isLogIn);
        LocalStorage.setString(LocalStorageKeys.token, LocalStorage.token);

        debugPrint(
          "Access token is 😎😎😎😎😎😎😎😎😎😎😎😎: ${LocalStorage.token}",
        );

        Get.snackbar("Login!", "Login Successful");
        Get.toNamed(AppRoute.mainBottomNavScreen);

        emailTEController.clear();
        passwordTEController.clear();
      } else {
        Get.snackbar(response.statusCode.toString(), "Login Failed");
      }

      update();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailTEController.dispose();
    passwordTEController.dispose();
  }

  //============================================controller end
}
