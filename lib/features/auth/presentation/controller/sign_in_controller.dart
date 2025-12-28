import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/core/network/end_point/api_end_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as ApiServices;

import '../../../../services/api_services/api_response_model.dart';
import '../../../../services/api_services/api_services.dart';
import '../../data/auth_model.dart';

class SignInController extends GetxController{


  bool isLoading = false;
  AuthModel? authModel;
  String errorMessage = "";

  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();


  bool isShowPassword=true;


  void isPasswordToggle(){
    isShowPassword=!isShowPassword;
    update();
  }

  @override
  void dispose() {

    super.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();

  }


  Future<void> signIn() async {
    isLoading = true;
    update();

    ApiResponseModel response = await ApiService.post(
      ApiEndPoint.login,
      body: {
        "email": emailTEController.text,
        "password": passwordTEController.text,

      },
      headers: {
        'Content-Type':'application/json'
      }
    );

    if (response.isSuccess && response.statusCode==200) {

      authModel = AuthModel.fromJson(response.data);

      
      ApiService.defaultHeaders['Authorization'] =
      "Bearer ${authModel!.token}";

      Get.snackbar("Success", "Login successful");
      Get.offAllNamed(AppRoute.mainBottomNavScreen);
    } else {
      errorMessage = response.message ?? "Invalid credentials";
      Get.snackbar("Login Failed😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒", errorMessage);
      debugPrint("Login Failed😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒$errorMessage",);
    }

    isLoading = false;
  }
}