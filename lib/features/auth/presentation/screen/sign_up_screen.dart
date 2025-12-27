import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/component/app_text_field/app_text_field.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/auth/presentation/widget/auth_bg_widget.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:brain_denner/uitls/constants/appIcons/app_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../../../uitls/constants/appString/app_string.dart';
import '../controller/sign_up_controller.dart';
import '../widget/continue_with_social_media_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final SignUpController controller = Get.put(SignUpController());

bool isChecked = false;

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthBgWidget(
              headerTextSize: 24.sp,
              headerText: AppString.signUpToFirstFood,

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
                    AppText(text: 'Name', color: AppColors.white),
                    SizedBox(height: 14),

                    AppTextField(
                      controller: controller.nameTEController,
                      hintText: 'Enter name',
                    ),
                    SizedBox(height: 16.h),

                    AppText(text: 'Email address', color: AppColors.white),
                    SizedBox(height: 14),

                    AppTextField(
                      controller: controller.emailTEController,
                      hintText: 'Enter email address',
                    ),
                    SizedBox(height: 16),

                    AppText(text: AppString.password, color: AppColors.white),

                    SizedBox(height: 14.h),

                    Obx(
                      () => AppTextField(
                        onSuffixTap: controller.firstPasswordToggle,
                        obscureText: !controller.isFirstPasswordIsShow.value,
                        suffixIcon: controller.isFirstPasswordIsShow.value
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                        controller: controller.passwordTEController,
                        hintText: 'Enter Password',
                      ),
                    ),

                    AppText(
                      text: AppString.confirmPassword,
                      color: AppColors.white,
                    ),

                    Column(
                      children: [
                        SizedBox(height: 14),

                        Obx(
                          () => AppTextField(
                            obscureText:
                                !controller.isConfirmPasswordIsShow.value,
                            suffixIcon: controller.isConfirmPasswordIsShow.value
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined,
                            onSuffixTap: controller.confirmPasswordToggle,
                            controller: controller.confirmPasswordTEController,
                            hintText: 'Confirm password',
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    Center(child: Text("Most people start by checking food before or\nafter eating.",textAlign:TextAlign.center,style: TextStyle(color: AppColors.mosttextcolors,fontSize: 15),)),

                    SizedBox(height: 20.h),


                    AppButton(
                      text: AppString.signUp,
                      onPressed: () {
                        debugPrint("Sign Up===>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                      },
                    ),

                    SizedBox(height: 25.h,),


                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account?? ",
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: "  Sign In",
                              style: TextStyle(
                                color: AppColors.forgetcolor,
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {

                                Get.toNamed(AppRoute.signInScreen);

                                },
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 89.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
