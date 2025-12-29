import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/component/app_text_field/app_text_field.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/auth/presentation/controller/sign_in_controller.dart';
import 'package:brain_denner/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:brain_denner/features/auth/presentation/widget/auth_bg_widget.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:brain_denner/uitls/constants/appIcons/app_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../uitls/constants/appString/app_string.dart';
import '../widget/continue_with_social_media_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}


bool isChecked = false;

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
   return GetBuilder<SignInController>(builder: (controller){

     return  Scaffold(
       backgroundColor: AppColors.primaryColor,
       body: SingleChildScrollView(
         child: Column(
           children: [
             AuthBgWidget(
               headerTextSize: 24,
               headerText: AppString.signInToFirstFood,

               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.w),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 24),

                     AppText(
                       text: AppString.emailAddress,
                       color: AppColors.white,
                     ),

                     SizedBox(height: 14),
                     AppTextField(
                       controller: controller.emailTEController,
                       hintText: 'Enter email address',
                     ),
                     SizedBox(height: 16),
                     AppText(text: AppString.password, color: AppColors.white),

                     Column(
                       children: [
                         SizedBox(height: 14),
                         AppTextField(
                           obscureText: controller.isShowPassword,
                           onSuffixTap: controller.isPasswordToggle,
                           suffixIcon: controller.isShowPassword?Icons.visibility_off_outlined:Icons.visibility_outlined,
                           controller: controller.passwordTEController,
                           hintText: 'Enter password',
                         ),
                       ],
                     ),

                     SizedBox(height: 24.h),

                     buildRememBerMeSection(),

                     SizedBox(height: 24),

                     Center(child: Text("You don’t have to get it right — just check in.",style: TextStyle(
                       fontSize: 14.sp,
                         fontWeight: FontWeight.w400,
                         color: AppColors.mosttextcolors),)),

                     SizedBox(height: 20),


                     AppButton(
                       text: AppString.login,
                       onPressed: () {

                         Get.toNamed(AppRoute.mainBottomNavScreen);

                       },
                     ),
                     SizedBox(height: 41),

                     buildORSection(),

                     SizedBox(height: 24.h),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         //===================continue with google
                         ContinueWithSocialMediaSection(
                           title: 'Google',
                           imagePath: AppIcons.googleLogo,
                         ),

                         //=================continue with apple
                         ContinueWithSocialMediaSection(
                           title: 'Apple',
                           imagePath: AppIcons.appleLogo,
                         ),
                       ],
                     ),

                     SizedBox(height: 45.h),
                     buildRichText(),

                     SizedBox(height: 93.h),
                   ],
                 ),
               ),
             ),
           ],
         ),
       ),
     );
   });

  }

  Row buildRichText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: "  Sign Up",
                style: TextStyle(
                  color: AppColors.forgetcolor,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    onTapSignUpText();
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildORSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 142.w,
          child: Divider(thickness: 1.5, color: Color(0xFF5B5B5B)),
        ),

        SizedBox(width: 17.w),

        AppText(text: 'Or', color: Color(0xFF5B5B5B)),
        SizedBox(width: 17.w),

        SizedBox(
          width: 142.w,
          child: Divider(thickness: 1.5, color: Color(0xFF5B5B5B)),
        ),
      ],
    );
  }

  Row buildRememBerMeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Row(
        //   children: [
        //     SizedBox(
        //       height: 18,
        //       width: 18,
        //       child: Checkbox(
        //         value: isChecked,
        //         checkColor: Color(0xff00D4FF),
        //         fillColor: MaterialStateProperty.resolveWith<Color>((states) {
        //           if (states.contains(MaterialState.selected)) {
        //             return Colors.transparent; // checked fill
        //           }
        //           return Colors.transparent; // unchecked fill
        //         }),
        //         side: MaterialStateBorderSide.resolveWith((states) {
        //           if (states.contains(MaterialState.selected)) {
        //             return const BorderSide(
        //               color: Color(0xff00D4FF),
        //               width: 1,
        //             );
        //           }
        //           return const BorderSide(
        //             color: Colors.grey,
        //             width: 1,
        //           );
        //         }),
        //         onChanged: (bool? value) {
        //           setState(() {
        //             isChecked = value ?? false;
        //           });
        //         },
        //       ),
        //     ),
        //
        //     SizedBox(width: 6),
        //
        //     AppText(
        //       text: AppString.rememberMe,
        //       fontWeight: FontWeight.w400,
        //       color: AppColors.white,
        //       fontSize: 12,
        //     ),
        //   ],
        // ),

        InkWell(
          onTap: onTapForgotPasswordButton,
          child: AppText(
            text: AppString.forgotPassword,
            color: AppColors.forgetcolor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  void onTapForgotPasswordButton(){
     Get.toNamed(AppRoute.forgotPasswordScreen);
  }

  void onTapSignUpText(){

    Get.toNamed(AppRoute.signUpScreen);
  }
}
