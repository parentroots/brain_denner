import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/onBoarding/presentation/widget/onBoardingWidget.dart';
import 'package:brain_denner/uitls/constants/appString/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../uitls/constants/appColors/app_colors.dart';

class OnBoardingThirdScreen extends StatefulWidget {
  const OnBoardingThirdScreen({super.key});

  @override
  State<OnBoardingThirdScreen> createState() => _OnBoardingThirdScreenState();
}

class _OnBoardingThirdScreenState extends State<OnBoardingThirdScreen> {
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
                headerText: AppString.whatAreYouEatingToday,
                skipText: 'Skip',
                skipTextSize: 20,
                bodyText: AppString.chooseWhatFitsYourMomentWellKeepItSimple,
                bodyTextSize: 20.sp,
                onTap: () {
                  Get.toNamed(AppRoute.signInScreen);
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
    Get.toNamed(AppRoute.signInScreen);
  }

  void onTapSkipButton() {
    Get.toNamed(AppRoute.signInScreen);
  }
}
