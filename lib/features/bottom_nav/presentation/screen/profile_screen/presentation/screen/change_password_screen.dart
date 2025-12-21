import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/change_password_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../component/app_text/app_text.dart';
import '../../../../../../../component/app_text_field/app_text_field.dart';
import '../../../../../../../uitls/constants/appColors/app_colors.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordScreenController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            centerTitle: true,
            title: AppText(
              text: 'Change Password',
              color: Color(0xFFFEFEFE),
              fontSize: 24.sp,
            ),
            backgroundColor: AppColors.primaryColor,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 38.h),

                AppText(
                  text: 'Current Password',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 14.h),
                AppTextField(
                  suffixIcon: controller.currentPasswordIsShow
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  obscureText: controller.currentPasswordIsShow,
                  onSuffixTap: controller.currentPasswordToggle,
                  controller: controller.currentPasswordTEController,
                  hintText: 'Enter current Password',
                ),

                SizedBox(height: 16),

                AppText(
                  text: 'New Password',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 14.h),
                AppTextField(
                  obscureText: controller.newPasswordIsShow,
                  onSuffixTap: controller.newPasswordToggle,
                  suffixIcon: controller.newPasswordIsShow
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  controller: controller.newPasswordTEController,
                  hintText: 'Enter New Password',
                ),

                SizedBox(height: 16),

                AppText(
                  text: 'Confirm New Password',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 14.h),
                AppTextField(
                  obscureText: controller.confirmNewPasswordIsShow,
                  onSuffixTap: controller.confirmNewPasswordToggle,
                  suffixIcon: controller.confirmNewPasswordIsShow
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  controller: controller.confirmNewPasswordTEController,
                  hintText: 'Enter Confirm Password',
                ),
                
                
                Spacer(),
                
                AppButton(text: 'Change Password', onPressed: (){

                }),

                SizedBox(height: 90.h,),
                
                
                
              ],
            ),
          ),
        );
      },
    );
  }
}
