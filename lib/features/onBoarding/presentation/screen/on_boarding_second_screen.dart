import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/onBoarding/presentation/widget/onBoardingWidget.dart';
import 'package:brain_denner/uitls/constants/appString/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../uitls/constants/appColors/app_colors.dart';

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
              OnBoardingWidget(
                headerText: AppString.thisIsNotAboutBeingPerfect,
                skipText: 'Skip',
                skipTextSize: 20,
                bodyText: AppString.itsAboutClarity,
                bodyTextSize: 20.sp,
                onTap: () {

                  onTapSkipButton();

                },
                child: Column(
                  children: [
                    AppButton(
                      text: AppString.next,
                      onPressed: () {
                        onTapNextButton();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapNextButton() {
    Get.toNamed(AppRoute.onBoardingThirdScreen);
  }

  void onTapSkipButton(){
    Get.offAllNamed(AppRoute.signInScreen);
  }


}
