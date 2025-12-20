import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../uitls/constants/appColors/app_colors.dart';


class FoodItemCard extends StatelessWidget {
  const FoodItemCard({
    super.key,
    required this.title,
    required this.carbs,
    required this.protein,
    required this.fat,
    this.isFavourite = false,
    required this.iconPath, required this.onTap, required this.onTapItem,
  });

  final String title;
  final String carbs;
  final String protein;
  final String fat;
  final bool isFavourite;
  final String iconPath;
  final VoidCallback onTap;
  final VoidCallback onTapItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapItem,
      child: Container(
        height: 78.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          gradient: const LinearGradient(
            colors: [
              Color(0xff0B3C5D),
              Color(0xff075475),
            ],
          ),
        ),
        child: Row(
          children: [


            Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.15),
                shape: BoxShape.circle,
              ),
              child: Image.asset(iconPath),
            ),

            SizedBox(width: 12.w),


            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  Row(
                    children: [


                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '$carbs ',
                              style: TextStyle(
                                color: AppColors.orangeColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'carbs',
                              style: TextStyle(
                                color: Color(0xFF8E8E8E),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),


                      SizedBox(width: 29.w,),



                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: protein,
                              style: TextStyle(
                                color: AppColors.orangeColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'protein',
                              style: TextStyle(
                                color: Color(0xFF8E8E8E),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),


                      SizedBox(width: 29.w,),


                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: fat,
                              style: TextStyle(
                                color: AppColors.orangeColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'fat',
                              style: TextStyle(
                                color: Color(0xFF8E8E8E),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),






                    ],
                  ),
                ],
              ),
            ),

            InkWell(
              onTap: onTap,
              child: Icon(
                isFavourite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }



}
