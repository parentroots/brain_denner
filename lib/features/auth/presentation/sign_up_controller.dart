import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  RxBool isFirstPasswordIsShow=false.obs;
  RxBool isConfirmPasswordIsShow=false.obs;



  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController confirmPasswordTEController = TextEditingController();


  
  void firstPasswordToggle(){
   isFirstPasswordIsShow.value=!isFirstPasswordIsShow.value;
  }

  void confirmPasswordToggle(){
    isConfirmPasswordIsShow.value=!isConfirmPasswordIsShow.value;
  }


  @override
  void dispose() {
    super.dispose();
    nameTEController.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
    confirmPasswordTEController.dispose();
  }




}


