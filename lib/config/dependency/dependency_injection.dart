import 'package:brain_denner/features/auth/presentation/controller/otp_verify_controller.dart';
import 'package:brain_denner/features/auth/presentation/controller/set_new_password_controller.dart';
import 'package:brain_denner/features/auth/presentation/controller/sign_in_controller.dart';
import 'package:brain_denner/features/auth/presentation/controller/sign_up_controller.dart';
import 'package:brain_denner/features/auth/presentation/controller/forgot_password_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/controller/main_bottom_nav_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/home_screen/presentation/controller/nutrition_details_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/change_password_screen_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/edit_pofile_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/history_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/privacy_policy_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/profile_screen_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/support_and_contact_screen_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/terms_and_service_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/progress_screen/controller/progress_screen_controller.dart';

import 'package:get/get.dart';

import '../../features/bottom_nav/presentation/screen/favourite_screen/presentation/controller/favourite_controller.dart';
import '../../features/bottom_nav/presentation/screen/home_screen/presentation/controller/home_screen_controller.dart';
import '../../features/bottom_nav/presentation/screen/home_screen/presentation/controller/restaurant_details_controller.dart';
import '../../features/bottom_nav/presentation/screen/home_screen/presentation/controller/restaurant_list_controller.dart';
import '../../features/bottom_nav/presentation/screen/profile_screen/controller/rating_app_controller.dart';

class DependencyInjection extends Bindings{
  @override
  void dependencies() {

    ///================ Auth Controller =================
    Get.lazyPut(() => SupportAndContactScreenController(), fenix: true);
    Get.lazyPut(() => RateAppController(), fenix: true);
    Get.lazyPut(() => PrivacyPolicyController(), fenix: true);
    Get.lazyPut(() => TermsAndServiceController(), fenix: true);
     Get.lazyPut(() => TermsAndServiceController(), fenix: true);
     Get.lazyPut(() => PrivacyPolicyController(), fenix: true);
     Get.lazyPut(() => SignUpController(), fenix: true);
     Get.lazyPut(() => ForgotPasswordController(), fenix: true);
     Get.lazyPut(() => OtpVerifyController(), fenix: true);
     Get.lazyPut(() => SetNewPasswordController(), fenix: true);
     Get.lazyPut(() => SignInController(), fenix: true);
     Get.lazyPut(() => MainBottomNavController(), fenix: true);
     Get.lazyPut(() => HomeScreenController(), fenix: true);
     Get.lazyPut(() => RestaurantListController(), fenix: true);
     Get.lazyPut(() => RestaurantDetailsController(), fenix: true);
     Get.lazyPut(() => NutritionDetailsController(), fenix: true);
     Get.lazyPut(() => ProgressScreenController(), fenix: true);
     Get.lazyPut(() => ProfileScreenController(), fenix: true);
     Get.lazyPut(() => ChangePasswordScreenController(), fenix: true);
     Get.lazyPut(() => SupportAndContactScreenController(), fenix: true);
     Get.lazyPut(() => FavouriteController(), fenix: true);
     Get.lazyPut(() => HistoryController(), fenix: true);
     Get.lazyPut(() => EditPofileController(), fenix: true);

  }
}