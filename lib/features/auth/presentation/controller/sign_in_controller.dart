import 'package:get/get.dart';

class SignInController extends GetxController{
  bool isShowPassword=true;


  void isPasswordToggle(){
    isShowPassword=!isShowPassword;
    update();
  }

  @override
  void dispose() {

    super.dispose();

  }

}