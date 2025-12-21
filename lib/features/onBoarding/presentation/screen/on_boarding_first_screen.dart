import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/onBoarding/presentation/widget/onBoardingWidget.dart';
import 'package:brain_denner/uitls/constants/appString/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../uitls/constants/appColors/app_colors.dart';

class OnBoardingFirstScreen extends StatefulWidget {
  const OnBoardingFirstScreen({super.key});

  @override
  State<OnBoardingFirstScreen> createState() => _OnBoardingFirstScreenState();
}

class _OnBoardingFirstScreenState extends State<OnBoardingFirstScreen> {
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
                headerText: AppString.letsMakeThisEasier,
                skipText: 'Skip',
                skipTextSize: 20,
                bodyText: AppString.yourAreHereToMakeOneGoodDecisionAndThatEnough,
                bodyTextSize: 20.sp,
                 onTap: () {

                  Get.offNamed(AppRoute.signInScreen);
                 },
                child: Column(
                  children: [AppButton(text: AppString.next, onPressed: () {
                    onTapNextButton();
                  })],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapNextButton(){
    Get.toNamed(AppRoute.onBoardingSecondScreen);
  }


}
