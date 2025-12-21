import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../component/app_text/app_text.dart';
import '../../../../../../../uitls/constants/appColors/app_colors.dart';
import '../../../../../../../uitls/constants/appImages/app_images.dart';


class FavouriteItemCard extends StatelessWidget {
  const FavouriteItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              height: 78.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90.r),
                gradient: LinearGradient(
                  colors: [Color(0xFF00243F), Color(0xFF075476)],
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: Image.asset(AppImages.chicken),
                  ),

                  SizedBox(width: 17.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      AppText(text: "fries",fontSize: 24,fontWeight: FontWeight.w500,),
                      SizedBox(height: 2.h,),
                      Row(children: [


                        RichText(
                          text: TextSpan(
                            text: 'Carbs',
                            style: TextStyle(
                              color: AppColors.orangeColor,
                              fontSize: 10.sp,
                            ),
                            children: [
                              TextSpan(
                                text: '25g',
                                style: TextStyle(
                                  color: Color(0xFF8E8E8E),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                        ),SizedBox(width: 40.w,),


                        RichText(
                          text: TextSpan(
                            text: 'Carbs',
                            style: TextStyle(
                              color: AppColors.orangeColor,
                              fontSize: 10.sp,
                            ),
                            children: [
                              TextSpan(
                                text: '25g',
                                style: TextStyle(
                                  color: Color(0xFF8E8E8E),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                        ),SizedBox(width: 40.w,),




                        RichText(
                          text: TextSpan(
                            text: 'Carbs',
                            style: TextStyle(
                              color: AppColors.orangeColor,
                              fontSize: 10.sp,
                            ),
                            children: [
                              TextSpan(
                                text: '25g',
                                style: TextStyle(
                                  color: Color(0xFF8E8E8E),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                        )


                      ],)

                    ],
                  ),

                  SizedBox(width: 80.w,),


                  Image.asset(AppImages.love,color: Colors.red,)



                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 15.h);
        },
      ),
    );
  }
}