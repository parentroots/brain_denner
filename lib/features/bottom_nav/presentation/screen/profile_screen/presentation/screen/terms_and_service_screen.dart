import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/terms_and_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/privacy_policy_controller.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';

import '../../../../../../../uitls/constants/appImages/app_images.dart';


class TermsAndServiceScreen extends StatelessWidget {
  const TermsAndServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TermsAndServiceController>(
      init: TermsAndServiceController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            leading: InkWell(
              onTap: Get.back,
              child: Image.asset(AppImages.backImage),
            ),
            centerTitle: true,
            title: AppText(
              text: 'Terms Of Service',
              color: Color(0xFFFEFEFE),
              fontSize: 24.sp,
            ),
            backgroundColor: AppColors.primaryColor,
          ),
          body: controller.isLoading
              ? Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
              : SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: AppText(
              text: controller.termsAndServices,
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        );
      },
    );
  }
}