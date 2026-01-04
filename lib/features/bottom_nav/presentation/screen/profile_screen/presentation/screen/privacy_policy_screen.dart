import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/privacy_policy_controller.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';

import '../../../../../../../uitls/constants/appIcons/app_icons.dart';
import '../../../../../../../uitls/constants/appImages/app_images.dart';


class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyPolicyController>(
      init: PrivacyPolicyController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            leadingWidth:70,
            leading: Row(
              children: [

                SizedBox(width: 10.w,),
                InkWell(
                  onTap: Get.back,
                  child: SizedBox(
                      child: SvgPicture.asset(AppIcons.back)),
                ),
              ],
            ),
            centerTitle: true,
            title: AppText(
              text: 'Privacy Policy',
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
              text: controller.privacyPolicy,
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        );
      },
    );
  }
}