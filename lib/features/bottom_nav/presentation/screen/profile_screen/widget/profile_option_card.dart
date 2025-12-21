import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileOptionCard extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const ProfileOptionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      height: 60.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90.r),
        border: Border.all(width: 1, color: Color(0xFF082A45)),
        color: Color(0xff00243F),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
             Image.asset(icon),

              SizedBox(width: 8.w,),
              AppText(
                text: title,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ],
          ),

          InkWell(
            onTap: onTap,
            child: Icon(Icons.keyboard_arrow_right_sharp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
