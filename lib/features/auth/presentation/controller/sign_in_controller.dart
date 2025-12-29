import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/core/network/end_point/api_end_point.dart';
import 'package:brain_denner/storage/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as ApiServices;

import '../../../../services/api_services/api_response_model.dart';
import '../../../../services/api_services/api_services.dart';
import '../../../../storage/storage_keys.dart';
import '../../data/auth_model.dart';

class SignInController extends GetxController {
  bool isLoading = false;
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

  Future<void> signIn() async {

    Get.offAllNamed(AppRoute.mainBottomNavScreen);

    isLoading = true;
    update();

    try {
      ApiResponseModel response = await ApiService.post(
        ApiEndPoint.login,
        body: {
          "email": emailTEController.text,
          "password": passwordTEController.text,
        },
        headers: {'Content-Type': 'application/json'},
      );

      if (response.isSuccess && response.statusCode == 200) {
        authModel = AuthModel.fromJson(response.data);
        final accessToken = authModel?.accessToken;

        if (accessToken != null && accessToken.isNotEmpty) {
          await LocalStorage.setString(LocalStorageKeys.token, accessToken);
          await LocalStorage.setString(LocalStorageKeys.refreshToken, accessToken);
          await LocalStorage.setBool(LocalStorageKeys.isLogIn, true);

          await LocalStorage.setString(LocalStorageKeys.userId, authModel?.userId ?? "");
          await LocalStorage.setString(LocalStorageKeys.myName, authModel?.name ?? "");
          await LocalStorage.setString(LocalStorageKeys.myEmail, authModel?.email ?? "");

          ApiService.defaultHeaders['Authorization'] = "Bearer $accessToken";
          LocalStorage.refreshToken = accessToken;
          LocalStorage.isLogIn = true;

          Get.snackbar("Success", "Login successful");
          Get.offAllNamed(AppRoute.mainBottomNavScreen);
        } else {
          Get.snackbar("Error", "Token not found from server");
        }
      } else {
        errorMessage = response.message ?? "Invalid credentials";
        Get.snackbar("Login Failed", errorMessage);
        debugPrint("Login Failed: $errorMessage");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
      debugPrint("SignIn Error: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

}
