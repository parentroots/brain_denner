import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:brain_denner/uitls/constants/appIcons/app_icons.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: AppText(text: 'Account Settings', fontSize: 24),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),

            InfoWidget(
              image: AppImages.lock,
              title: 'change password',
              onTap: () {
                Get.toNamed(AppRoute.changePasswordScreen);
              },
            ),
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
