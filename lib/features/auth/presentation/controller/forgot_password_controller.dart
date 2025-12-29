import 'dart:math';

import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/services/api_services/api_response_model.dart';
import 'package:brain_denner/services/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/network/end_point/api_end_point.dart';

class ForgotPasswordController extends GetxController{

  final TextEditingController forgotEmailTEController=TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    forgotEmailTEController.dispose();
  }



  // Future<void>getOtp()async{
  //
  //   ApiResponseModel response = await ApiService.post(
  //     ApiEndPoint.forgotPassword,
  //     body: {
  //       "email": forgotEmailTEController.text.trim(),
  //     },
  //     headers: {'Content-Type': 'application/json'},
  //   );
  //   debugPrint(response.statusCode.toString());
  // }




  Future<void>sendOtp()async{

    if(forgotEmailTEController.text.isEmpty){
      debugPrint("😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒");
    }

    ApiResponseModel response=await ApiService.post(
      ApiEndPoint.forgotPassword,
      body: {
        'email':forgotEmailTEController.text.trim()
      },

      headers: {'Content-Type': 'application/json'},
    );


    if(response.statusCode==200){
      Get.toNamed(AppRoute.otpVerificationScreen,arguments: {
        "email":forgotEmailTEController.text.trim()
      });

    }else{
      Get.snackbar('warning', response.message.toString());

      debugPrint("${response.message}😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒");
    }

  }




}