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
                    width: 440.w,
                    height: 280.h,
                    child: Image.asset(AppImages.logoWithName),
                  ),
              
                  SizedBox(height: 16),
              
                  AppText(
                    text: AppString.welcomeBrian,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),

                  SizedBox(height: 10.h),

                  AppText(
                    text: AppString.letsthinklhrough,
                    fontSize: 20.sp,
                    color: AppColors.nextmealcolor,
                  ),


                  SizedBox(height: 24.h),
              
                  SearchBoxWidget(
                    controller: controller.searchTEController,
                    hintText: 'Search Food or Restaurants',
                  ),
              
                  SizedBox(height: 10.h),

                // buildDailyCard(),
              
                  SizedBox(height: 24.h),
                  AppButton(
                    text: AppString.showRestaurants,
                    textColor: Color(0xff075475),
                    onPressed: () {
                      controller.onTapShowRestaurantButton();
                    },
                  ),
                  SizedBox(height: 34.h),



                  Column(children: [
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color:AppColors.whiteGrey45,
                            thickness: 1,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Recently checked",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Divider(
                            color: AppColors.whiteGrey45,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ],),

              SizedBox(height: 20.h,),

              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF062F4F),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [

                        Row(
                          children: [
                            Icon(
                              Icons.restaurant,
                              color: Colors.orange,
                              size: 22,
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                "Fries",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.white54,
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),
                        const Divider(color: Colors.white24, height: 1),
                        const SizedBox(height: 12),


                        Row(
                          children: [
                            Icon(
                              Icons.lunch_dining,
                              color: Colors.orange,
                              size: 22,
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                "Chicken Sandwich",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.white54,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )],),
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
