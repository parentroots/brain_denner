import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:brain_denner/uitls/constants/appString/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../widget/search_box_widget.dart';
import '../controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  SizedBox(
                    width: 430.w,
                    height: 265.h,
                    child: Image.asset(AppImages.logoWithName),
                  ),
              
                  SizedBox(height: 16),
              
                  AppText(
                    text: AppString.welcomeBrian,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
              
                  SizedBox(height: 24.h),
              
                  SearchBoxWidget(
                    controller: controller.searchTEController,
                    hintText: 'Search Food or Restaurants',
                  ),
              
                  SizedBox(height: 25.h),
              
                  buildDailyCard(),
              
                  SizedBox(height: 24.h),
                  AppButton(
                    text: AppString.showRestaurants,
                    textColor: Color(0xff075475),
                    onPressed: () {
                      controller.onTapShowRestaurantButton();
                    },
                  ),
                  SizedBox(height: 34.h),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 24.w,
                        width: 24.w,
                        child: Image.asset(AppImages.star1Image),
                      ),
                      SizedBox(height: 8.w),
                      AppText(
                        text: AppString.updatedMenusAvailable,
                        color: AppColors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  SingleChildScrollView buildDailyCard() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            height: 164.h,
            width: 124.w,
            decoration: BoxDecoration(
              color: AppColors.navyBlueColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 52.h,
                  width: 108.w,
                  child: Image.asset(AppImages.protinImage),
                ),
                AppText(
                  text: AppString.todaysCarbs,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blue,
                ),

                AppText(text: '40g', fontSize: 40, fontWeight: FontWeight.w600),

                SizedBox(height: 4.h),

                AppText(
                  text: 'left',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blue,
                ),
              ],
            ),
          ),
          SizedBox(width: 12.h),
          Container(
            height: 164.h,
            width: 124.w,
            decoration: BoxDecoration(
              color: AppColors.navyBlueColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 52.h,
                  width: 108.w,
                  child: Image.asset(AppImages.alarmImage),
                ),

                AppText(
                  text: AppString.recentMeal,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blue,
                ),
                AppText(
                  text: 'Fries',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),

                SizedBox(height: 2.h),

                AppText(
                  textAlign: TextAlign.center,
                  text: 'Chicken Sandwich',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
          SizedBox(width: 12.h),
          Container(
            height: 164.h,
            width: 124.w,
            decoration: BoxDecoration(
              color: AppColors.navyBlueColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 52.h,
                  width: 108.w,
                  child: Image.asset(AppImages.starImage),
                ),
                AppText(
                  text: 'Premium Insights',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blue,
                ),

                AppText(
                  textAlign: TextAlign.center,
                  text: AppString.advancedCarbBreakdownAndSmarterChoices,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 4.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
