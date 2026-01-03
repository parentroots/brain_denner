
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

    Get.toNamed(AppRoute.mainBottomNavScreen);


    // Get.toNamed(AppRoute.mainBottomNavScreen);
    update();

    Map<String, String> body = {
      "email": emailTEController.text,
      "password": passwordTEController.text,
    };

    var response = await ApiService.post(
      ApiEndPoint.autLogin,
      body: body,
    ).timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      var data = response.data;

      Get.snackbar("meessage", "working");
      Get.toNamed(AppRoute.mainBottomNavScreen);


      LocalStorage.token = data['data']["accessToken"];
      LocalStorage.userId = data['data']["attributes"]["_id"];
      LocalStorage.myImage = data['data']["attributes"]["image"];
      LocalStorage.myName = data['data']["attributes"]["fullName"];

      LocalStorage.myEmail = data['data']["attributes"]["email"];
      LocalStorage.isLogIn = true;

      LocalStorage.setBool(LocalStorageKeys.isLogIn, LocalStorage.isLogIn);
      LocalStorage.setString(LocalStorageKeys.token, LocalStorage.token);
      LocalStorage.setString(LocalStorageKeys.userId, LocalStorage.userId);
      LocalStorage.setString(LocalStorageKeys.myImage, LocalStorage.myImage);
      LocalStorage.setString(LocalStorageKeys.myName, LocalStorage.myName);
      LocalStorage.setString(LocalStorageKeys.myEmail, LocalStorage.myEmail);


      emailTEController.clear();
      passwordTEController.clear();
    } else {
      Get.snackbar(response.statusCode.toString(),"rong");
    }

    update();
  }


}
