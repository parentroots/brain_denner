import 'package:brain_denner/features/bottom_nav/presentation/screen/favourite_screen/data/favourite_data_model.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/favourite_screen/presentation/controller/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../../../../../../../component/app_text/app_text.dart';
import '../../../../../../../uitls/constants/appImages/app_images.dart';

class FavouriteItemCard extends StatelessWidget {
  const FavouriteItemCard({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavouriteController>();
    return Expanded(
      child: ListView.separated(
        itemCount: controller.favouriteList.length,
        itemBuilder: (context, index) {

          final data=controller.favouriteList[index];
          return InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              height: 78.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90.r),
                gradient: LinearGradient(
                  colors: [Color(0xFF00243F), Color(0xFF075476)],
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: Image.asset(AppImages.chicken),
                  ),

                  SizedBox(width: 17.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: data.food!.name.toString(),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          AppText(
                            text: data.note.toString(),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8E8E8E),
                          ),
                        ],
                      ),
                    ],
                  ),



                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 15.h);
        },
      ),
    );
  }
}
