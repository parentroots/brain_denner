import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/onBoarding/presentation/screen/on_boarding_first_screen.dart';
import 'package:brain_denner/storage/storage_services.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((val) {

      print("isLogin : ${LocalStorage.isLogIn}😁😁😁😁");
      print("accesstoken : ${LocalStorage.token}😁😁😁😁");


      if (LocalStorage.token!="") {
        Get.offAllNamed(AppRoute.mainBottomNavScreen);
      } else {
        Get.toNamed(AppRoute.onBoardingFirstScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primaryColor),
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SizedBox(
          height: 142.h,
          width: 136.w,
          child: Image.asset(AppImages.appLogo),
        ),
      ),
    );
  }
}
