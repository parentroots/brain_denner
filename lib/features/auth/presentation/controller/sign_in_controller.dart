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

  Future<void> signIn() async {

    Get.toNamed(AppRoute.mainBottomNavScreen);

    isLoading.value = true;
    update();

    try{
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

        final accessToken=response.data["data"]["accessToken"]??"";
        LocalStorage.token = accessToken;
        LocalStorage.isLogIn = true;
        await LocalStorage.setString(LocalStorageKeys.token, LocalStorage.token);
        await LocalStorage.setBool(LocalStorageKeys.isLogIn, LocalStorage.isLogIn);

        isLoading.value=false;
        update();
        
        print("AccessToken😁😁😁😁 ${LocalStorage.token}");
        print("isLogin😁😁😁😁 ${LocalStorage.isLogIn}");


        Get.toNamed(AppRoute.mainBottomNavScreen);

      } else {
        errorMessage = response.message ?? "Invalid credentials";
        Get.snackbar(
          "Login Failed😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒",
          errorMessage,
        );
        debugPrint(
          "Login Failed😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒$errorMessage",
        );
        isLoading.value==false;
        update();
      }
    }
    catch(e){
      Get.snackbar(
        "Login Failed😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒",
        e.toString(),
      );
      isLoading.value=false;
      update();
    }
    finally{
      isLoading.value=false;
      update();
    }


  }
}
