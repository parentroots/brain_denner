import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SetNewPasswordController extends GetxController{

  final TextEditingController newPasswordTEController =TextEditingController();
  final TextEditingController confirmNewPasswordTEController =TextEditingController();

  bool isNewPasswordShow=false;
  bool isConfirmNewPasswordShow=false;




  void isNewPasswordShowToggle(){
    isNewPasswordShow=!isNewPasswordShow;
    update();
  }

  void isConfirmNewPasswordShowToggle(){
    isConfirmNewPasswordShow=!isConfirmNewPasswordShow;
    update();
  }


  void onTapUpdateButton(){
    Get.toNamed(AppRoute.mainBottomNavScreen);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    newPasswordTEController.dispose();
    confirmNewPasswordTEController.dispose();
  }

}