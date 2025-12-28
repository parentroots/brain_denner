import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/home_screen/presentation/controller/nutrition_details_controller.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../uitls/constants/appColors/app_colors.dart';
import '../widget/nutrition_card.dart';

class NutritionDetailsScreen extends StatelessWidget {
  const NutritionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NutritionDetailsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            leading: InkWell(
              onTap: Get.back,
              child: Image.asset(AppImages.backImage),
            ),
            title: Text('Fries', style: TextStyle(color: Colors.white)),
            centerTitle: true,
            actions: [
              Image.asset(AppImages.love),
              SizedBox(width: 1.w),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),

                  AppText(
                    textAlign: TextAlign.start,
                    text: 'What usually happens',
                    color: Color(0xFF00D4FF),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),

                  SizedBox(height: 20.h),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text:
                          'Fries tend to raise blood sugar quickly, especially when eaten alone',
                      color: AppColors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1,
                      width: double.maxFinite,
                      decoration: BoxDecoration(color: Color(0xff3B3B3B)),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  AppText(
                    text: 'Why this matters?',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blue,
                  ),

                  AppText(
                    text:
                        'WBecause digestion is fast, timing often matters more than total carbs',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),

                  SizedBox(height: 20.h),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1,
                      width: double.maxFinite,
                      decoration: BoxDecoration(color: Color(0xff3B3B3B)),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  AppText(
                    text: 'Digestion Profile',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),

                  SizedBox(height: 8.h),

                  AppText(
                    text: 'Moderate Absorption',
                    color: AppColors.orangeColor,
                  ),

                  SizedBox(height: 8.h),

                  AppText(
                    text:
                        'Often affects blood sugar within 40–90 minutes Min-Max',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),

                  SizedBox(height: 10.h),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1,
                      width: double.maxFinite,
                      decoration: BoxDecoration(color: Color(0xff3B3B3B)),
                    ),
                  ),

                  SizedBox(height: 26.h),

                  AppText(
                    text:
                        'Digestion profiles are estimates based on typical \n food composition. Individual responses may vary. \n This information is for awareness only and is not \n insulin or dosing advice.',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),

                  SizedBox(height: 26.h),

                  NutritionInfoCard(),

                  SizedBox(height: 52.h),

                  AppButton(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    text: 'Save this meal',
                    onPressed: () {
                      Get.toNamed(AppRoute.mainBottomNavScreen);
                    },
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }




}

class NutritionCard extends StatelessWidget {
  const NutritionCard({super.key, required this.title, required this.calories});

  final String title;
  final String calories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(text: title, color: Colors.white, fontSize: 20.sp),
        AppText(
          text: calories,
          color: AppColors.orangeColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
