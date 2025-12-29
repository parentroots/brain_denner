import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../component/app_text_field/app_text_field.dart';
import '../../../../../../auth/presentation/screen/sign_up_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: Get.back,
          child: Image.asset(AppImages.backImage),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: AppText(text: 'Eit Profile', fontSize: 24),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),

            AppText(
              text: 'Name',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 14.h),
            // AppTextField(
            //   controller: controller.confirmPasswordTEController,
            //   hintText:"Enter your name",
            //   obscureText: controller.isLoading,
            //   suffixIcon: controller.isLoading
            //       ? Icons.visibility_off_outlined
            //       : Icons.visibility_outlined,
            // ),
          ],
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const InfoWidget({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90.r),
          gradient: LinearGradient(
            colors: [Color(0xFF00243F), Color(0xFF082A45)],
          ),
        ),
        child: Row(
          children: [
            Image.asset(image),
            SizedBox(width: 8.h),
            AppText(text: title, fontSize: 18, fontWeight: FontWeight.w600),
          ],
        ),
      ),
    );
  }
}
