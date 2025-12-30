import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/appRoutes/app_routes.dart';
import '../../../../core/network/end_point/api_end_point.dart';
import '../../../../services/api_services/api_response_model.dart';
import '../../../../services/api_services/api_services.dart';
import '../../data/auth_model.dart';

class OtpVerifyController extends GetxController {
  late String email;
  late String type;

  bool isLoading = false;
  AuthModel? authModel;
  String errorMessage = "";

  final TextEditingController otpVerifyTEController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments?['email'] ?? '';

    print("argumeatt is💕💕💕${email}");


  }



  Future<void> verifyOtp() async {
    if (otpVerifyTEController.text.isEmpty) {
      Get.snackbar("Error", "Please enter OTP");
      return;
    }

    isLoading = true;
    update();

    try {
      ApiResponseModel response = await ApiService.post(
        ApiEndPoint.verifyEmail,
        body: {
          "oneTimeCode": int.parse(otpVerifyTEController.text),
          "email": email.trim(),
        },

      );

      print("OTP Response: ${response.data}");
      print("OTP eail: ${email}");
      print("OTP : ${otpVerifyTEController}");
      print("OTP Status Code: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        authModel = AuthModel.fromJson(response.data);

        Get.snackbar(
          "Success",
          response.data['message'] ?? "Verify Success",
          snackPosition: SnackPosition.BOTTOM,
        );

        Future.delayed(Duration(milliseconds: 300), () {
          Get.offAllNamed(AppRoute.signInScreen);
        });

        clearTextField();
      } else {
        errorMessage =
            response.data?['message'] ?? response.message ?? "Verify failed";

        Get.snackbar(
          "OTP Verify Failed",
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
        );

        debugPrint('OTP verify error: $errorMessage');
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
      debugPrint('OTP verify exception: $e');
    } finally {
      isLoading = false;
      update();
    }
  }




  Future<void> verifyOtpforgotpassword() async {
    if (otpVerifyTEController.text.isEmpty) {
      Get.snackbar("Error", "Please enter OTP");
      return;
    }

    isLoading = true;
    update();

    try {
      ApiResponseModel response = await ApiService.post(
        ApiEndPoint.verifyEmail,
        body: {
          "oneTimeCode": int.parse(otpVerifyTEController.text),
          "email": email.trim(),
        },

      );

      print("OTP Response: ${response.data}");
      print("OTP eail: ${email}");
      print("OTP : ${otpVerifyTEController}");
      print("OTP Status Code: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {


        Get.snackbar(
          "Success",
          response.data['message'] ?? "Verify Success",
          snackPosition: SnackPosition.BOTTOM,
        );

        Future.delayed(Duration(milliseconds: 300), () {
          Get.offAllNamed(AppRoute.setNewPasswordScreen);
        });

        clearTextField();
      } else {
        errorMessage =
            response.data?['message'] ?? response.message ?? "Verify failed";

        Get.snackbar(
          "OTP Verify Failed",
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
        );

        debugPrint('OTP verify error: $errorMessage');
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
      debugPrint('OTP verify exception: $e');
    } finally {
      isLoading = false;
      update();
    }
  }





  /// Clear OTP text field
  void clearTextField() {
    otpVerifyTEController.clear();
  }

  @override
  void onClose() {
    otpVerifyTEController.dispose();
    super.onClose();
  }
}
