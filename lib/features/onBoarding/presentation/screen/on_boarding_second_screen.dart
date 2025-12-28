import 'package:brain_denner/app/app.dart';
import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/row_text/row_text.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/onBoarding/presentation/widget/onBoardingWidget.dart';
import 'package:brain_denner/uitls/constants/appString/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../uitls/constants/appColors/app_colors.dart';
import '../../../../uitls/constants/appImages/app_images.dart';

class OnBoardingSecondScreen extends StatefulWidget {
  const OnBoardingSecondScreen({super.key});

  @override
  State<OnBoardingSecondScreen> createState() => _OnBoardingSecondScreenState();
}

class _OnBoardingSecondScreenState extends State<OnBoardingSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Column(
                children: [

                  SizedBox(height: 100.h,),
                  SizedBox(
                    height: 142.h,
                    width: 136.w,
                    child: Center(child: Image.asset(AppImages.appLogo)),
                  ),


                ],

              ),


              SizedBox(height: 30.h,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("${AppString.whatthsiapp}",style: TextStyle(color: AppColors.endcolors,fontSize: 36.sp,fontWeight: FontWeight.w600),),

                  SizedBox(height: 20.h,),

                  ColumnAppTextWithDot(
                    valueWeight: FontWeight.w400,
                    value1: "${AppString.helpsExplain}",value2: "${AppString.focusesOnPatterns}",value3: "${AppString.supporttsLearningOver}",),

                  SizedBox(height: 71.h,),

                  AppButton(
                    text: AppString.Continue,
                    onPressed: () {
                      onTapNextButton();
                    },
                  ),



                ],

              ),

            ],
          ),
        ),
      ),
    );
  }

  void onTapNextButton() {

    Get.toNamed(AppRoute.signInScreen);
  }

  void onTapSkipButton(){
    Get.offAllNamed(AppRoute.signInScreen);
  }


}
