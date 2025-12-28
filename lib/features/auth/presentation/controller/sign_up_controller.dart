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


  bool isLoading = false;
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

  @override
  void dispose() {
    super.dispose();
    nameTEController.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
    confirmPasswordTEController.dispose();
  }


  //=================================Sign user===============================

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    update();

    ApiResponseModel response = await ApiService.post(
      ApiEndPoint.login,
      body: {
        "name": name,
        "email": email,
        "password": password,
      },
    );

    if (response.isSuccess) {
      authModel = AuthModel.fromJson(response.data);
      Get.snackbar("Success", "Account created");
    } else {
      errorMessage = response.message ?? "Signup failed";
      Get.snackbar("Error", errorMessage);
    }

    isLoading = false;
    update();
  }

}