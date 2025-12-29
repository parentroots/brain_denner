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

  Future<void> signUp() async {
    isLoading = true;
    update();

    ApiResponseModel response = await ApiService.post(
        ApiEndPoint.createUser,
        body: {
          "name": nameTEController.text,
          "email": emailTEController.text,
          "password": passwordTEController.text,
        },
        headers: {
          'Content-Type': 'application/json'
        }

    );

    if (response.isSuccess && (response.statusCode == 200 || response.statusCode == 201)) {
      authModel = AuthModel.fromJson(response.data);
      Get.snackbar("Success", "Account created");


      Get.toNamed(AppRoute.otpVerificationScreen, arguments: {
        'email': emailTEController.text,
        'type':'signUp'
      });


    } else {
      errorMessage = response.message ?? "Signup failed";
      Get.snackbar("Error", errorMessage);

      debugPrint('error is:::😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒$errorMessage');
    }

    isLoading = false;
    update();
  }




  void clearTextField(){
    nameTEController.clear();
    passwordTEController.clear();
    confirmPasswordTEController.clear();
    emailTEController.clear();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameTEController.dispose();
    passwordTEController.dispose();
    confirmPasswordTEController.dispose();
    emailTEController.dispose();
  }




}