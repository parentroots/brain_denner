import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({
    super.key,
    required this.title,
    required this.carbs,
    required this.protein,
    required this.fat,
    this.isFavourite = false,
    required this.iconPath,
    required this.onTap,
    required this.onTapItem,
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
            // Icon
            Container(
              height: 50.h,
              width: 50.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Image.asset(iconPath),
            ),
            SizedBox(width: 16.w),

            // Title and Info
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  AppText(text: title,fontSize: 20.sp,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  // Text(
                  //   title,
                  //   style: TextStyle(
                  //     fontSize: 20.sp,
                  //     fontWeight: FontWeight.w600,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  SizedBox(height: 6.h),

                  // Info Row - single line with separator
                  Text(
                    'Fast impact  |  Slow digestion  |  Often spikes later',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9CA3AF),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),

            SizedBox(width: 12.w),

            // Favorite icon with background
            InkWell(
              onTap: onTap,
              child: Container(
                height: 40.h,
                width: 40.h,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.25),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}