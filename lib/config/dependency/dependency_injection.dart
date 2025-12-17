import 'package:brain_denner/features/auth/presentation/sign_up_controller.dart';
import 'package:get/get.dart';

class DependencyInjection extends Bindings{
  @override
  void dependencies() {

    ///================ Auth Controller =================

     Get.lazyPut(() => SignUpController(), fenix: true);

  }
}