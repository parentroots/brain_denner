import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/component/app_text_field/app_text_field.dart';
import 'package:brain_denner/features/auth/presentation/controller/set_new_password_controller.dart';
import 'package:brain_denner/features/auth/presentation/widget/auth_bg_widget.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:brain_denner/uitls/constants/appString/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetNewPasswordController>(
      init: SetNewPasswordController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthBgWidget(
                    headerText: AppString.setNewPassword,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32.h),
                        
                        /// New Password
                        AppText(
                          text: 'New Password',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 14.h),
                        AppTextField(
                          controller: controller.newPasswordTEController,
                          hintText: 'Enter Password',
                          obscureText: controller.isNewPasswordShow,
                          suffixIcon: controller.isNewPasswordShow
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          onSuffixTap: controller.isNewPasswordShowToggle,
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
                          hintText: 'Enter Password',
                          obscureText: controller.isConfirmNewPasswordShow,
                          suffixIcon: controller.isConfirmNewPasswordShow
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          onSuffixTap: controller.isConfirmNewPasswordShowToggle,
                        ),
                        
                        SizedBox(height: 40.h),
                        
                        /// Update Button
                        AppButton(
                          text: AppString.update,
                          onPressed: controller.onTapUpdateButton,
                        ),
                        
                        SizedBox(height: 60.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
