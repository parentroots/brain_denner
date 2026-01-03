import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/change_password_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../component/app_text/app_text.dart';
import '../../../../../../../component/app_text_field/app_text_field.dart';
import '../../../../../../../uitls/constants/appColors/app_colors.dart';
import '../../../../../../../uitls/constants/appImages/app_images.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordScreenController>(
      init: ChangePasswordScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(

            leading: InkWell(
              onTap: Get.back,
              child: Image.asset(AppImages.backImage),
            ),
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
            title: AppText(
              text: 'Change Password',
              color: const Color(0xFFFEFEFE),
              fontSize: 24.sp,
            ),
          ),

          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 38.h),

                /// Current Password
                AppText(
                  text: 'Current Password',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 14.h),
                AppTextField(
                  controller: controller.currentPasswordTEController,
                  hintText: 'Enter current Password',
                  obscureText: controller.currentPasswordIsShow,
                  suffixIcon: controller.currentPasswordIsShow
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  onSuffixTap: controller.currentPasswordToggle,
                ),

                SizedBox(height: 16.h),

                /// New Password
                AppText(
                  text: 'New Password',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 14.h),
                AppTextField(
                  controller: controller.newPasswordTEController,
                  hintText: 'Enter New Password',
                  obscureText: controller.newPasswordIsShow,
                  suffixIcon: controller.newPasswordIsShow
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  onSuffixTap: controller.newPasswordToggle,
                ),

                SizedBox(height: 16.h),

                /// Confirm Password
                AppText(
                  text: 'Confirm New Password',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 14.h),
                AppTextField(
                  controller: controller.confirmNewPasswordTEController,
                  hintText: 'Enter Confirm Password',
                  obscureText: controller.confirmNewPasswordIsShow,
                  suffixIcon: controller.confirmNewPasswordIsShow
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  onSuffixTap: controller.confirmNewPasswordToggle,
                ),

                SizedBox(height: 80.h),

                /// Button
                AppButton(
                  text: 'Change Password',
                  onPressed: () {

                    controller.changePasswordRepo();
                  },
                ),

                SizedBox(height: 90.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
