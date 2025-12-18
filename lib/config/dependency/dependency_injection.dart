import 'package:brain_denner/features/auth/presentation/controller/otp_verify_controller.dart';
import 'package:brain_denner/features/auth/presentation/controller/set_new_password_controller.dart';
import 'package:brain_denner/features/auth/presentation/controller/sign_in_controller.dart';
import 'package:brain_denner/features/auth/presentation/controller/sign_up_controller.dart';
import 'package:brain_denner/features/auth/presentation/controller/forgot_password_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/controller/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class DependencyInjection extends Bindings{
  @override
  void dependencies() {

    ///================ Auth Controller =================

     Get.lazyPut(() => SignUpController(), fenix: true);
     Get.lazyPut(() => ForgotPasswordController(), fenix: true);
     Get.lazyPut(() => OtpVerifyController(), fenix: true);
     Get.lazyPut(() => SetNewPasswordController(), fenix: true);
     Get.lazyPut(() => SignInController(), fenix: true);
     Get.lazyPut(() => MainBottomNavController(), fenix: true);

  }
}