import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/home_screen/presentation/controller/nutrition_details_controller.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../uitls/constants/appColors/app_colors.dart';

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
              SizedBox(width: 10.w),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppText(
                    text: 'Nutrition Info',
                    color: Color(0xFF00D4FF),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),

                  SizedBox(height: 41.h),

                  buildNutritionInfoSection(),

                  SizedBox(height: 41.h),

                  buildServingSection(controller),

                  SizedBox(height: 10.h),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: 'Digestion Profile',
                      color: AppColors.blue,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 38.h),

                  buildBottomCardSection(),

                  SizedBox(height: 20.h),
                  AppText(
                    text:
                        'Digestion profiles are estimates based on typical \n food composition. Individual responses may vary. \n This information is for awareness only and is not \n insulin or dosing advice.',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  
                  
                  SizedBox(height: 55.h,),
                  
                  
                  AppButton(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      text: 'Meal Intake', onPressed: (){

                    Get.toNamed(AppRoute.homeScreen);

                  }),

                  SizedBox(height: 20.h,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container buildBottomCardSection() {
    return Container(
      height: 158.h,
      width: 398.w,
      decoration: BoxDecoration(
        color: Color(0xff00243F),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Digestion Speed:',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),

            SizedBox(height: 12.h),
            Row(
              children: [
                SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: Image.asset(AppImages.weightImage),
                ),

                SizedBox(width: 10.w),
                AppText(
                  text: 'Moderate Absorption',
                  color: AppColors.orangeColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: AppText(
                text: 'Typical Absorption: 40- 90 Min max',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 15.h),

            Row(
              children: [
                Image.asset(AppImages.whatImage),
                SizedBox(width: 10.w),
                AppText(
                  text: 'Protein and fat may slow digestion',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildServingSection(NutritionDetailsController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(AppImages.serveImage),
            SizedBox(width: 11.w),
            AppText(
              text: 'Serving Size',
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),

        Container(
          height: 40.h,
          width: 136.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90.r),
            gradient: LinearGradient(
              colors: [Color(0xFF002540), Color(0xFF075475)],
            ),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: controller.decrementCount,
                child: Image.asset(AppImages.minusImage),
              ),

              AppText(
                text: controller.count.toString(),
                color: AppColors.orangeColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              InkWell(
                onTap: controller.incrementCount,
                child: Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container buildNutritionInfoSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 32.h),
      height: 351.h,
      width: 3987.w,
      decoration: BoxDecoration(
        color: Color(0xFF00243F),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NutritionCard(title: 'Carbs', calories: '175g'),
              SizedBox(width: 61.w),
              NutritionCard(title: 'Calories', calories: '25g'),
              SizedBox(width: 61.w),
              NutritionCard(title: 'Protein', calories: '175g'),
            ],
          ),

          SizedBox(height: 50.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NutritionCard(title: 'Fat', calories: '175g'),
              SizedBox(width: 61.w),
              NutritionCard(title: 'Sugar', calories: '25g'),
              SizedBox(width: 61.w),
              NutritionCard(title: 'Fiber', calories: '175g'),
            ],
          ),

          SizedBox(height: 50.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NutritionCard(title: 'Sodium', calories: '175g'),
              SizedBox(width: 61.w),
              NutritionCard(title: 'Calories', calories: '25g'),
              SizedBox(width: 61.w),
              NutritionCard(title: 'Protein', calories: '175g'),
            ],
          ),
        ],
      ),
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
