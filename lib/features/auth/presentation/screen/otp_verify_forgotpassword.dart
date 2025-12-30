import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/component/app_text_field/app_text_field.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/auth/presentation/widget/auth_bg_widget.dart';
import 'package:brain_denner/uitls/constants/appString/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../uitls/constants/appColors/app_colors.dart';
import '../controller/otp_verify_controller.dart';

class OtpVerifyForgotpassword extends StatefulWidget {
  const OtpVerifyForgotpassword({super.key});

  @override
  State<OtpVerifyForgotpassword> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerifyForgotpassword> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpVerifyController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                AuthBgWidget(
                  headerText: 'Verify Account',
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 12.h),

                        Align(
                          alignment: Alignment.center,
                          child: AppText(
                            textAlign: TextAlign.center,
                            text: 'Enter your verification code that we have sent your email sh********123@gmail.com',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        SizedBox(height: 40.h),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(
                            text:'Enter code',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        SizedBox(height: 14.h,),

                        PinCodeTextField(
                          length: 6,
                          appContext: context,
                          controller: controller.otpVerifyTEController,

                          obscureText: false,
                          hintCharacter: '●',
                          hintStyle: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 24.sp,
                          ),


                          keyboardType: TextInputType.number,

                          animationType: AnimationType.fade,
                          animationDuration: const Duration(milliseconds: 300),

                          enableActiveFill: true,
                          backgroundColor: Colors.transparent,

                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(12),

                            fieldHeight: 60,
                            fieldWidth: 56.w,


                            // 🔹 Border Color
                            inactiveColor: const Color(0xff313E48),
                            selectedColor:const Color(0xffB0F2FF),
                            activeColor: const Color(0xffB0F2FF),


                            inactiveFillColor: AppColors.primaryColor,
                            selectedFillColor:  AppColors.primaryColor,
                            activeFillColor:  AppColors.primaryColor,

                            errorBorderColor: Colors.red,
                            disabledColor: const Color(0xff313E48),
                          ),

                          textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),

                          onCompleted: (value) {
                            print("OTP Completed: $value");
                          },

                          onChanged: (value) {},
                        ),


                        SizedBox(height: 60.h),

                        Visibility(
                          replacement: Center(child: CircularProgressIndicator(),),
                          child: AppButton(text: 'Verify',fontSize: 24,fontWeight: FontWeight.w600, onPressed: (){
                            controller.verifyOtpforgotpassword();
                          }),
                        )


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


  void onTapVerifyButton(){
    Get.toNamed(AppRoute.setNewPasswordScreen);
  }




}
