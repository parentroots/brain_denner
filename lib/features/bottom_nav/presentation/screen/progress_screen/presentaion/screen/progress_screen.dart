import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/progress_screen/controller/progress_screen_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/progress_screen/widget/nutrition_card.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../../../uitls/constants/appColors/app_colors.dart';
import '../../widget/recent_meal_card.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showPaymentBottomSheetDialog();
    });
  }

  void _showPaymentBottomSheetDialog() {
    Get.bottomSheet(
      isScrollControlled: true,
      Container(
        height: Get.height * 0.9,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF065375), Color(0xFF002540)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              SizedBox(height: 35.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: Align(
                  alignment: Alignment.center,
                  child: AppText(
                    textAlign: TextAlign.center,
                    text: 'Unlock your health and nutrition journey',
                    fontWeight: FontWeight.w500,
                    fontSize: 28.sp,
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              AppText(
                text: '7 Days free Trial',
                color: Color(0xFFB3B3B3),
                fontSize: 16.sp,
              ),

              SizedBox(height: 41.h),

              PremiumOfferCard(title: 'Unlock more resturants.'),

              SizedBox(height: 32.h),

              PremiumOfferCard(
                title:
                    '"Find fast-food carbs and nutrition \ninstantly.Simple, fast, and always\n up-to-date."',
              ),

              SizedBox(height: 32.h),
              PremiumOfferCard(
                title:
                '"Find fast-food carbs and nutrition \ninstantly.Simple, fast, and always\n up-to-date."',
              ),

              SizedBox(height: 32.h),

              PremiumOfferCard(
                title:
                '"Find fast-food carbs and nutrition \ninstantly.Simple, fast, and always\n up-to-date."',
              ),


              SizedBox(height: 32.h),
              PremiumOfferCard(
                title:
                '"Find fast-food carbs and nutrition \ninstantly.Simple, fast, and always\n up-to-date."',
              ),

              SizedBox(height: 32.h),


              PremiumOfferCard(
                title:
                '"Find fast-food carbs and nutrition \ninstantly.Simple, fast, and always\n up-to-date."',
              ),

              SizedBox(height: 40.h,),


              AppButton(text: 'Start 7 day free trail \$49.99', onPressed:(){
                debugPrint("❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️");
                Get.back();
              })
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProgressScreenController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.primaryColor,
            centerTitle: true,
            title: Text(
              'Progress',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ),

          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: AppText(
                    text: 'Today’s Nutrition Summary',
                    fontSize: 20.sp,
                    color: AppColors.blue,
                  ),
                ),

                SizedBox(height: 20.h),
                CircularPercentIndicator(
                  radius: 100.r,
                  lineWidth: 10,
                  percent: 0.8,
                  backgroundColor: Colors.transparent,
                  progressColor: AppColors.orangeColor,
                  startAngle: 220,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: 'Today’s',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      AppText(
                        text: '40g',
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      AppText(
                        text: 'Used today',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blue,
                      ),
                    ],
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      NutritionCard(title: 'Carbs', weight: '40g'),
                      SizedBox(width: 12.w),
                      NutritionCard(title: 'Calories', weight: '2540'),
                      SizedBox(width: 12.w),

                      NutritionCard(title: 'Carbs', weight: '5510mg'),
                      SizedBox(width: 12.w),
                    ],
                  ),
                ),

                SizedBox(height: 41.h),

                AppButton(
                  text: 'Add New Item',
                  onPressed: () {
                    Get.toNamed(AppRoute.restaurantListScreen);
                  },
                ),
                SizedBox(height: 24.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    text: 'Recent Meal',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blue,
                  ),
                ),
                SizedBox(height: 24.h),

                RecentMealCard(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PremiumOfferCard extends StatelessWidget {
  final String title;

  const PremiumOfferCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check, color: AppColors.orangeColor),
        SizedBox(width: 12.w),
        AppText(text: title, fontSize: 16.sp),
      ],
    );
  }
}
