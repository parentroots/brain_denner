import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as ApiServices;

import '../../../../config/appRoutes/app_routes.dart';
import '../../../../core/network/end_point/api_end_point.dart';
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
      "/login",
      body: {

        // "email": email,
        // "password": password,

      },
    );

    if (response.isSuccess) {

      authModel = AuthModel.fromJson(response.data);

      // 🔐 Attach token
      
      ApiService.defaultHeaders['Authorization'] =
      "Bearer ${authModel!.token}";

      Get.snackbar("Success", "Login successful");
      Get.offAllNamed("/home");
    } else {
      errorMessage = response.message ?? "Invalid credentials";
      Get.snackbar("Login Failed", errorMessage);
    }

    isLoading = false;
  }
}