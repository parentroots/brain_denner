import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:brain_denner/uitls/constants/appString/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    this.skipText = '',
    this.skipTextSize = 20,
    this.headerText = '',
    this.headerTextSize = 24,
    required this.bodyText,
    required this.bodyTextSize,
    required this.child,
    required this.onTap,
  });

  final String skipText;
  final double skipTextSize;
  final String headerText;
  final double headerTextSize;
  final String bodyText;
  final double bodyTextSize;
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16.w, top: 60.h),
              child: InkWell(
                onTap: onTap,
                child: AppText(
                  text: skipText,
                  fontSize: skipTextSize.sp,
                  color: AppColors.whiteGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 226.h),

        SizedBox(
          height: 142.h,
          width: 136.w,
          child: Image.asset(AppImages.appLogo),
        ),

        SizedBox(height: 52.h),

        AppText(
          text: headerText,
          fontSize: headerTextSize.sp,
          gradient: LinearGradient(
            colors: [AppColors.skyBlueColor,AppColors.primarySecondaryColor, ],
          ),
        ),


        SizedBox(height: 16.h),


        AppText(
          textAlign: TextAlign.center,
          text: bodyText,
          fontSize: bodyTextSize,
          color: AppColors.whiteGrey,
        ),

        SizedBox(height: 152.h),

        child,

      ],
    );
  }
}
