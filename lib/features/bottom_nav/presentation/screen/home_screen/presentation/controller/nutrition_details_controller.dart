import 'dart:ui';

import 'package:get/get.dart';

class NutritionDetailsController extends GetxController{

  int count=0;

  void incrementCount(){
    count=count+1;
    update();
  }


  void decrementCount(){
    count=count-1;
    if(count<1){
      count=1;
      Get.snackbar('Warning', 'Must one order need',colorText: Color(0xFFFFFFFF));

    }
    update();
  }

}