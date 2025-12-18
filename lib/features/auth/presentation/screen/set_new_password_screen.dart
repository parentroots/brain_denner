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

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetNewPasswordController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: AuthBgWidget(
            headerText: AppString.setNewPassword,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(height: 32.h),
                    
                    AppText(text: 'New Password',fontSize: 14,fontWeight: FontWeight.w400,),
                    SizedBox(height: 14.h,),
                    AppTextField(
                      suffixIcon: controller.isNewPasswordShow?Icons.visibility_off_outlined:Icons.visibility_outlined,
                      obscureText: controller.isNewPasswordShow,
                        onSuffixTap: controller.isNewPasswordShowToggle,
                        controller: controller.newPasswordTEController, hintText: 'Enter Password'),

                    SizedBox(height: 16,),


                    AppText(text: 'Confirm New Password',fontSize: 14,fontWeight: FontWeight.w400,),
                    SizedBox(height: 14.h,),
                    AppTextField(
                        obscureText: controller.isConfirmNewPasswordShow,
                        onSuffixTap: controller.isConfirmNewPasswordShowToggle,
                        suffixIcon: controller.isConfirmNewPasswordShow?Icons.visibility_off_outlined:Icons.visibility_outlined,
                        controller: controller.confirmNewPasswordTEController, hintText: 'Enter Password'),
                    
                    
                    SizedBox(height: 40.h,),
                    
                    
                    AppButton(text: AppString.update, onPressed: (){
                      controller.onTapUpdateButton();
                    })

              
              
              ]),
            ),
          ),
        );
      },
    );
  }





}
