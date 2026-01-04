import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:brain_denner/uitls/constants/appString/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),

                  // Logo
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

                  // Show Restaurants Button
                  AppButton(
                    text: AppString.showRestaurants,
                    textColor: Color(0xff075475),
                    onPressed: () {
                      controller.onTapShowRestaurantButton();
                    },
                  ),

                  SizedBox(height: 34.h),

                  // Recently Checked Header
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.whiteGrey45,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "Recently checked",
                        style: TextStyle(
                          color: Color(0xFFE7E7E7),
                          fontSize: 20.sp,
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

                  ListView.builder(
                    itemCount: controller.recentFoods.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = controller.recentFoods[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 12.h),
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
                                      Expanded(
                                        child: Text(
                                         data.food.name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
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

                                   SizedBox(height: 12.h),
                                   Divider(color: Colors.white24, height: 1.h),


                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 5.h,),

                        ],
                      );
                    },
                  ),

                  SizedBox(height:10.h ,),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
