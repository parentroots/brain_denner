import 'package:brain_denner/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:brain_denner/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:brain_denner/features/onBoarding/presentation/screen/on_boarding_first_screen.dart';
import 'package:brain_denner/features/onBoarding/presentation/screen/on_boarding_third_screen.dart';
import 'package:get/get.dart';

import '../../features/onBoarding/presentation/screen/on_boarding_second_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';



class AppRoute {
  ///====================  OnBoarding Routes ====================

  static const String splashScreen = "/splashScreen";
  static const String onBoardingFirstScreen = "/onBoardingFirstScreen";
  static const String onBoardingSecondScreen = "/onBoardingSecondScreen";
  static const String onBoardingThirdScreen = "/onBoardingThirdScreen";



  ///====================  Authentication Routes ====================

  static const String signInScreen = "/SignInScreen";
  static const String signUpScreen = "/SignUpScreen";



  static List<GetPage> routes = [
    ///==================== OnBoarding  Routes ====================
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onBoardingFirstScreen, page: () => const OnBoardingFirstScreen()),
    GetPage(name: onBoardingSecondScreen, page: () => const OnBoardingSecondScreen()),
    GetPage(name: onBoardingThirdScreen, page: () => const OnBoardingThirdScreen()),


    ///====================  Authentication Routes   ====================
    GetPage(name: signInScreen, page: () => const SignInScreen()),
    GetPage(name: signUpScreen, page: () => const SignUpScreen()),




  ];
}