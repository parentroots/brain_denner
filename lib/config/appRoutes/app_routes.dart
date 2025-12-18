import 'package:brain_denner/features/auth/presentation/screen/forgot_password_screen.dart';
import 'package:brain_denner/features/auth/presentation/screen/otp_verification_screen.dart';
import 'package:brain_denner/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:brain_denner/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:brain_denner/features/bottom_nav/main_bottom_nav_screen.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/favourite_screen/favourite_screen.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/home_scren/home_screen.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/profile_screen.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/progress_screen/progress_screen.dart';
import 'package:brain_denner/features/onBoarding/presentation/screen/on_boarding_first_screen.dart';
import 'package:brain_denner/features/onBoarding/presentation/screen/on_boarding_third_screen.dart';
import 'package:get/get.dart';
import '../../features/auth/presentation/screen/set_new_password_screen.dart';
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
  static const String forgotPasswordScreen = "/ForgotPasswordScreen";
  static const String otpVerificationScreen = "/OtpVerificationScreen";
  static const String setNewPasswordScreen = "/SetNewPasswordScreen";

  ///====================  Bottom Nav Routes ====================

    static const String mainBottomNavScreen = "/MainBottomNavScreen";
    static const String homeScreen = "/HomeScreen";
    static const String  profileScreen= "/ProfileScreen";
    static const String  progressScreen = "/ProgressScreen";
    static const String  favouriteScreen = "/FavouriteScreen";



  static List<GetPage> routes = [
    ///==================== OnBoarding  Routes ====================
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onBoardingFirstScreen, page: () => const OnBoardingFirstScreen()),
    GetPage(name: onBoardingSecondScreen, page: () => const OnBoardingSecondScreen()),
    GetPage(name: onBoardingThirdScreen, page: () => const OnBoardingThirdScreen()),


    ///====================  Authentication Routes   ====================
    GetPage(name: signInScreen, page: () => const SignInScreen()),
    GetPage(name: signUpScreen, page: () => const SignUpScreen()),
    GetPage(name: forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
    GetPage(name: otpVerificationScreen, page: () => const OtpVerificationScreen()),
    GetPage(name: setNewPasswordScreen, page: () => const SetNewPasswordScreen()),


    ///====================  Bottom Nav Routes ====================

       GetPage(name: mainBottomNavScreen, page: () => const MainBottomNavScreen()),
       GetPage(name: homeScreen, page: () => const HomeScreen()),
       GetPage(name: profileScreen, page: () => const ProfileScreen()),
       GetPage(name: progressScreen, page: () => const ProgressScreen()),
       GetPage(name: favouriteScreen, page: () => const FavouriteScreen()),


  ];
}