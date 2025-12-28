import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NutritionInfoCard extends StatelessWidget {
  const NutritionInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: const Color(0xFF0E5A6F), // bluish background
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r),topRight: Radius.circular(24.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
            height: 55.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r),topRight: Radius.circular(24.r)),
              color:Color(0xff002642)
            ),
            child: Row(
              children: [


                Image.asset(AppImages.serveImage),

                SizedBox(width: 5.w,),

                Text(
                  "Typical Serving",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),


          SizedBox(height: 14.h),

          //
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10.w),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       _nutritionItem("Carbs", "45g"),
          //       _nutritionItem("Fat", "20g"),
          //     ],
          //   ),
          // ),



          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [



                Column(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    _nutritionItem("Carbs", "45g"),
                    _nutritionItem("Carbs", "45g"),

                  ],
                ),

                Container(
                  height:40,
                  width: 2,
                  decoration: BoxDecoration(

                    color:Color(0xff3B3B3B)

                  ),
                ),

                Column(

                  children: [

                    _nutritionItem("Carbs", "45g"),
                    _nutritionItem("Carbs", "45g"),



                  ],
                ),




              ],
            ),
          ),




          SizedBox(height: 10.h),

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10.w),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       _nutritionItem("Protein", "4g"),
          //       _nutritionItem("Fiber", "2g"),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _nutritionItem(String label, String value) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}