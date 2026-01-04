import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../component/app_text/app_text.dart';
import '../../../../../../../uitls/constants/appColors/app_colors.dart';
import '../../../../../../../uitls/constants/appIcons/app_icons.dart';
import '../../controller/rating_app_controller.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RateAppController>(
      init: RateAppController(),
      builder: (controller) {
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
            centerTitle: true,
            title: AppText(
              text: 'Rate Our App',
              color: Color(0xFFFEFEFE),
              fontSize: 24.sp,
            ),
            backgroundColor: AppColors.primaryColor,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 43.h),

              Align(
                alignment: Alignment.center,
                child: Image.asset(AppImages.appLogo),
              ),

              SizedBox(height: 32.h),

              AppText(
                textAlign: TextAlign.center,
                text: 'How Would You\n Rate Our App Experience?',
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),

              SizedBox(height: 32.h),

              RatingBar.builder(
                initialRating: controller.rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40.sp,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: AppColors.orangeColor,
                ),
                onRatingUpdate: (rating) {
                  controller.updateRating(rating);
                },
              ),

              SizedBox(height: 16.h),

              if (controller.rating > 0)
                AppText(
                  text: '${controller.rating.toStringAsFixed(1)} Stars',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.orangeColor,
                ),

              SizedBox(height: 48.h),

              SizedBox(
                width: 291.w,
                child: controller.isLoading
                    ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
                    : AppButton(
                  text: 'Submit',
                  onPressed: () {
                    controller.submitRating();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}