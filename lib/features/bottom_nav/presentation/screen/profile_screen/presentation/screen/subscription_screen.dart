import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../component/app_text/app_text.dart';
import '../../../../../../../uitls/constants/appColors/app_colors.dart';
import '../../../../../../../uitls/constants/appImages/app_images.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: Image.asset(AppImages.backImage),
        ),
        centerTitle: true,
        title: AppText(
          text: 'Subscription',
          color: Color(0xFFFEFEFE),
          fontSize: 24.sp,
        ),
        backgroundColor: AppColors.primaryColor,
      ),

      body: Column(children: [



      ],),


    );
  }
}
