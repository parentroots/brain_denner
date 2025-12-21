import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreenController extends GetxController{


  final TextEditingController currentPasswordTEController=TextEditingController();
  final TextEditingController newPasswordTEController=TextEditingController();
  final TextEditingController confirmNewPasswordTEController=TextEditingController();

  bool currentPasswordIsShow=false;
  bool newPasswordIsShow=false;
  bool confirmNewPasswordIsShow=false;




  void currentPasswordToggle(){
    currentPasswordIsShow=!currentPasswordIsShow;
    update();
  }

  void newPasswordToggle(){
    newPasswordIsShow=!newPasswordIsShow;
    update();
  }

  void confirmNewPasswordToggle(){
    confirmNewPasswordIsShow=!confirmNewPasswordIsShow;
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    currentPasswordTEController.dispose();
    newPasswordTEController.dispose();
    currentPasswordTEController.dispose();
  }


}