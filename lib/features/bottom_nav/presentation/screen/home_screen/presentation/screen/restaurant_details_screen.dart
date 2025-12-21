import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/component/app_text_field/app_text_field.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/home_screen/presentation/widget/food_item_card.dart';
import 'package:brain_denner/features/bottom_nav/presentation/widget/search_box_widget.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../uitls/constants/appColors/app_colors.dart';
import '../controller/restaurant_details_controller.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantDetailsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            leading: InkWell(
              onTap: Get.back,
              child: Image.asset(AppImages.backImage),
            ),
            backgroundColor: AppColors.primaryColor,
            title: AppText(
              text: controller.restaurantName,
              color: AppColors.white,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                SearchBoxWidget(
                  controller: controller.searchTEController,
                  hintText: 'Search Items',
                ),
                SizedBox(height: 24.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildTabSection(controller, 0, 'Breakfast'),
                      SizedBox(width: 15.w),
                      buildTabSection(controller, 1, 'Launch'),
                      SizedBox(width: 15.w),
                      buildTabSection(controller, 2, 'Dinner'),
                      SizedBox(width: 15.w),
                      buildTabSection(controller, 3, 'Snacks'),
                    ],
                  ),
                ),

                SizedBox(height: 32.h),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      controller.currentIndex = index;
                      controller.update();
                    },
                    children: [

                      ListView.separated(
                        itemCount: controller.breakFastFoodList.length,
                        itemBuilder: (context, index) {
                          final data = controller.breakFastFoodList[index];
                          return FoodItemCard(
                            onTapItem: () {
                              Get.toNamed(AppRoute.nutritionDetailsScreen);
                            },
                            title: data['title'],
                            carbs: data['carbs'],
                            protein: data['protein'],
                            fat: data['fat'],
                            iconPath: data['icon'],
                            onTap: () {
                              favouriteDialog(controller);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20);
                        },
                      ),



                      ListView.separated(
                        itemCount: controller.launchFoodList.length,
                        itemBuilder: (context, index) {
                          final data = controller.launchFoodList[index];
                          return FoodItemCard(
                            onTapItem: () {
                              Get.toNamed(AppRoute.nutritionDetailsScreen);
                            },
                            title: data['title'],
                            carbs: data['carbs'],
                            protein: data['protein'],
                            fat: data['fat'],
                            iconPath: data['icon'],
                            onTap: () {
                              favouriteDialog(controller);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20);
                        },
                      ),

                      ListView.separated(
                        itemCount: controller.dinnerFoodList.length,
                        itemBuilder: (context, index) {
                          final data = controller.dinnerFoodList[index];
                          return FoodItemCard(
                            onTapItem: () {
                              Get.toNamed(AppRoute.nutritionDetailsScreen);
                            },
                            title: data['title'],
                            carbs: data['carbs'],
                            protein: data['protein'],
                            fat: data['fat'],
                            iconPath: data['icon'],
                            onTap: () {
                              favouriteDialog(controller);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20);
                        },
                      ),

                      ListView.separated(
                        itemCount: controller.snackFoodList.length,
                        itemBuilder: (context, index) {
                          final data = controller.snackFoodList[index];
                          return FoodItemCard(
                            title: data['title'],
                            carbs: data['carbs'],
                            protein: data['protein'],
                            fat: data['fat'],
                            iconPath: data['icon'],
                            onTap: () {
                              favouriteDialog(controller);
                            }, onTapItem: () {
                              Get.toNamed(AppRoute.nutritionDetailsScreen);
                          },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  InkWell buildTabSection(
    RestaurantDetailsController controller,
    int index,
    String title,
  ) {
    return InkWell(
      onTap: () {
        controller.currentIndex = index;
        controller.update();
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        height: 50.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90.r),
          color: controller.currentIndex == index
              ? AppColors.orangeColor
              : null,
          gradient: controller.currentIndex == index
              ? null
              : const LinearGradient(
                  colors: [Color(0xff002540), Color(0xff075475)],
                ),
        ),
        child: Center(
          child: AppText(
            text: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void favouriteDialog(RestaurantDetailsController controller) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'Add to Favourite',
                      color: Colors.black,
                      fontSize: 20,
                    ),

                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Image.asset(AppImages.cancel),
                    ),
                  ],
                ),

                AppText(text: 'Write a note(Optional)'),

                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                SizedBox(
                  height: 44.h,
                  width: 211.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF075375),
                    ),
                    onPressed: () {
                      Get.back();
                      Get.snackbar(
                        'Favourite',
                        'product adding favourite',
                        backgroundColor: Colors.white54,
                        barBlur: 0.5,
                      );
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}
