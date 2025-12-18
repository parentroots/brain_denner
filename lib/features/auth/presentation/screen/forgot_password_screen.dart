import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/component/app_text_field/app_text_field.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/auth/presentation/widget/auth_bg_widget.dart';
import 'package:brain_denner/features/auth/presentation/controller/forgot_password_controller.dart';
import 'package:brain_denner/uitls/constants/appString/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../uitls/constants/appColors/app_colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                AuthBgWidget(
                  headerText: AppString.forgotPassword,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 12.h),
            
                        Align(
                          alignment: Alignment.center,
                          child: AppText(
                            text: AppString
                                .enterYourEmailAddressAndGetOtpForVerification,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
            
                        SizedBox(height: 40.h),
            
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(
                            text: AppString.emailAddress,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
            
                        SizedBox(height: 14.h,),
            
                        AppTextField(controller: controller.forgotEmailTEController, hintText: 'Enter email address'),
            
                        SizedBox(height: 60.h),
                        
                        AppButton(text: 'Get OTP',fontSize: 24,fontWeight: FontWeight.w600, onPressed: (){

                          onTapGetOtpButton();
                          
                        })
            
            
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  void onTapGetOtpButton(){

  Get.toNamed(AppRoute.otpVerificationScreen);
  }



}
