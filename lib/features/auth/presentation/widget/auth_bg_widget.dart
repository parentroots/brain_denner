import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:brain_denner/uitls/constants/appString/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthBgWidget extends StatelessWidget {
  const AuthBgWidget({
    super.key,

    this.headerText = '',
    this.headerTextSize = 24,
    required this.child,
  });

  final String headerText;
  final double headerTextSize;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80.h),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
          ],
        ),

        child,
      ],
    );
  }
}
