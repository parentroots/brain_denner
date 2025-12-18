import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerifyController extends GetxController{

  final TextEditingController otpVerifyTEController=TextEditingController();



  void onUpdateButton(){

   Get.snackbar('Password Changed ! ', 'Your password is updated now');
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    otpVerifyTEController.dispose();
  }

}