import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:brain_denner/uitls/constants/appString/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../config/appRoutes/app_routes.dart';
import '../../../../widget/search_box_widget.dart';
import '../controller/restaurant_list_controller.dart';

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantListController>(
      init: RestaurantListController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            leading: SizedBox(
              height: 31.31.w,
              width: 31.31.w,
              child: InkWell(
                onTap: Get.back,
                  child: Image.asset(AppImages.backImage)),
            ),
            backgroundColor: AppColors.primaryColor,
            centerTitle: true,
            title: AppText(
              text: AppString.restaurants,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              children: [
                SizedBox(height: 24.h),

                SearchBoxWidget(controller: controller.searchTEController),
                SizedBox(height: 27.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    text: AppString.availableresturant,
                    fontSize: 24.sp,
                    color: AppColors.blue,
                  ),
                ),

                SizedBox(height: 27.h),

                Expanded(
                  child: ListView.separated(
                    itemCount: controller.restaurantList.length,
                    itemBuilder: (context, index) {
                      final data = controller.restaurantList[index];
                      return InkWell(
                        onTap: () {
                          debugPrint("name : ❤️❤️❤️❤️❤️❤️❤️❤️${data["name"]}");
                          Get.toNamed(
                            AppRoute.restaurantDetailsScreen,
                            arguments: <String, dynamic>{
                              "id": data[index],
                              "name": data["name"],
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          height: 78.h,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90.r),
                            gradient: LinearGradient(
                              colors: [Color(0xff00243F), Color(0xff075476)],
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(data['image']),

                              SizedBox(width: 10),

                              AppText(text: data['name'], fontSize: 24.sp),

                            ],
                          ),


                        ),
                      );
                    },

                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 20.h);
                    },


                  ),

                ),

                Align(
                  child: AppText(
                    text: AppString.moreresturants,
                    fontSize: 20.sp,
                    color: AppColors.blue,
                  ),
                ),

                SizedBox(height: 60.h,)



              ],
            ),
          ),
        );
      },
    );
  }

  void onTapRestaurantList() {
    Get.toNamed(AppRoute.restaurantDetailsScreen);
  }
}
