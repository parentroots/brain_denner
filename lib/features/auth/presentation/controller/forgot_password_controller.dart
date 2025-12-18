import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{

  final TextEditingController forgotEmailTEController=TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    forgotEmailTEController.dispose();
  }


}