import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../../uitls/constants/appColors/app_colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: Get.back,
          child: Image.asset(AppImages.backImage),
        ),
        centerTitle: true,
        title: AppText(
          text: 'Privacy Policy',
          color: Color(0xFFFEFEFE),
          fontSize: 24.sp,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            AppText(
              maxLines: null,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              text:
                  'We created this app with one mission — to help you understand your health in a simple, clear, and meaningful way.  Your daily data deserves more than just numbers. Our goal is to turn it into insights you can trust, progress you can track, and habits you can build for a healthier lifestyle. From fitness tracking to heart health, sleep, stress, and overall well-being, every feature is designed to guide you, motivate you, and support your journey — one day at a time. We believe that good health should be accessible, empowering, and easy to manage.  That’s why we combine smart technology with an intuitive design to give you a complete view of your body and mind. Your health. Your progress. Your journey — made smarter.',
            ),
          ],
        ),
      ),
    );
  }
}
