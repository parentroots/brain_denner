import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    this.endtext = '',
    this.skipText = '',
    this.skipTextSize = 20,
    this.headerText1 = '',
    this.headerTextSize = 30,
    this.bodyText = '',
    this.bodyTextSize = 32,
    this.hadertext2 = "",
    this.child,
    this.onTap,
  });

  final String endtext;
  final String skipText;
  final String hadertext2;
  final double skipTextSize;
  final String headerText1;
  final double headerTextSize;
  final String bodyText;
  final double bodyTextSize;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 70.h,),
        SizedBox(
          height: 142.h,
          width: 136.w,
          child: Center(child: Image.asset(AppImages.appLogo)),
        ),

        SizedBox(height: 40.h,),

        if (headerText1.isNotEmpty)
          AppText(
            text: headerText1,
            fontSize: headerTextSize.sp,
            gradient: LinearGradient(
              colors: [
                AppColors.hadercolor,
                AppColors.hadercolor,
              ],
            ),
          ),


        AppText(
          textAlign: TextAlign.start,
          fontWeight: FontWeight.bold,
          text: hadertext2,
          fontSize: headerTextSize.sp,
          gradient: LinearGradient(
            colors: [
              AppColors.hadercolor,
              AppColors.hadercolor,
            ],
          ),
        ),



        if (bodyText.isNotEmpty)
          AppText(
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            text: bodyText,
            fontSize: bodyTextSize,
            color: AppColors.bodyColors,
          ),

        SizedBox(height: 30.h,),



        Text("${endtext}",textAlign:TextAlign.center,style: TextStyle(fontSize: 24.sp,color: AppColors.endcolors,),),

        if (child != null) child!,




      ],
    );
  }
}
