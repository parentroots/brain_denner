import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../../component/app_text/app_text.dart';
import '../../../../../../../uitls/constants/appColors/app_colors.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: Image.asset(AppImages.backImage),
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
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 30,
            itemPadding: EdgeInsets.symmetric(horizontal: 2),
            itemBuilder: (context, _) =>
                Icon(Icons.star, color: AppColors.orangeColor),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),

          SizedBox(height: 48.h),

          SizedBox(
            width: 291.w,
            child: AppButton(
              text: 'Submit',
              onPressed: () {
                Get.snackbar(
                  colorText: AppColors.white,
                  'Rating',
                  'thank you for rating our app',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
