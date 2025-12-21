import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../uitls/constants/appColors/app_colors.dart';

class NutritionCard extends StatelessWidget {
  const NutritionCard({super.key, required this.title, required this.weight});
  
  final String title;
  final String weight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      height: 124.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12.r),
       border: Border.all(
         width: 1,
         color: AppColors.orangeColor
       )
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(text: title,fontSize: 18,fontWeight: FontWeight.w500,),
            SizedBox(height: 16.h,),
            AppText(text: weight,fontSize: 32,fontWeight: FontWeight.w400,),
          ],
        ),
      ),
    );
  }
}
