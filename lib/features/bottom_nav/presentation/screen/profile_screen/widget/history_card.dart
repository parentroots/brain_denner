import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../component/app_text/app_text.dart';
import '../../../../../../../uitls/constants/appColors/app_colors.dart';
import '../../../../../../../uitls/constants/appImages/app_images.dart';


class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> menuList = [
      {"icon": AppImages.fries, "title": "Fries"},
      {"icon": AppImages.burrito, "title": "Burritto"},
      {"icon": AppImages.fries, "title": "Chicken Sandwich"},
      {"icon": AppImages.nuggets, "title": "Nuggets"},
    ];


    return Expanded(
      child: Padding(
        padding: EdgeInsetsGeometry.only(left: 10,right: 10,top: 30),
        child: ListView.separated(
          itemCount: menuList.length,
          separatorBuilder: (_, __) => SizedBox(height: 15.h),
          itemBuilder: (context, index) {
            final item = menuList[index];
        
            return InkWell(
              onTap: () {},
              child: Container(
                height: 64.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF0F4C75),
                      Color(0xFF083358),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      item["icon"]!,
                      height: 22.h,
                      width: 22.w,
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: AppText(
                        text: item["title"]!,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );

  }
}