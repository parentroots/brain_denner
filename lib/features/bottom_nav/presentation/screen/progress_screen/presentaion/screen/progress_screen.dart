import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/progress_screen/controller/progress_screen_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/progress_screen/widget/nutrition_card.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../../../component/row_text/row_text.dart';
import '../../../../../../../uitls/constants/appColors/app_colors.dart';
import '../../widget/recent_meal_card.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showPaymentBottomSheetDialog();
    });
  }

  void _showPaymentBottomSheetDialog() {
    Get.bottomSheet(
      isScrollControlled: true,
      Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF065375), Color(0xFF002540)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              SizedBox(height: 35.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: Align(
                  alignment: Alignment.center,
                  child: AppText(
                    textAlign: TextAlign.center,
                    text: 'Unlock your health and nutrition journey',
                    fontWeight: FontWeight.w500,
                    fontSize: 28.sp,
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              AppText(
                text: '7 Days free Trial',
                color: Color(0xFFB3B3B3),
                fontSize: 16.sp,
              ),

              SizedBox(height: 41.h),

              PremiumOfferCard(title: 'Unlock more resturants.'),

              SizedBox(height: 32.h),

              PremiumOfferCard(
                title:
                    '"Find fast-food carbs and nutrition \ninstantly.Simple, fast, and always\n up-to-date."',
              ),

              SizedBox(height: 32.h),
              PremiumOfferCard(
                title:
                    '"Find fast-food carbs and nutrition \ninstantly.Simple, fast, and always\n up-to-date."',
              ),

              SizedBox(height: 32.h),

              PremiumOfferCard(
                title:
                    '"Find fast-food carbs and nutrition \ninstantly.Simple, fast, and always\n up-to-date."',
              ),

              SizedBox(height: 32.h),
              PremiumOfferCard(
                title:
                    '"Find fast-food carbs and nutrition \ninstantly.Simple, fast, and always\n up-to-date."',
              ),

              SizedBox(height: 32.h),

              PremiumOfferCard(
                title:
                    '"Find fast-food carbs and nutrition \ninstantly.Simple, fast, and always\n up-to-date."',
              ),

              SizedBox(height: 40.h),

              AppButton(
                text: 'Start 7 day free trail \$49.99',
                onPressed: () {
                  debugPrint("❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️");
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProgressScreenController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.primaryColor,
            centerTitle: true,
            title: Text(
              'Progress',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AppText(
                      textAlign: TextAlign.center,
                      text:
                          'Understanding patterns over time — not daily perfection.  ',
                      fontSize: 20.sp,
                      color: AppColors.blue,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  Container(
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 10,
                      bottom: 10,
                      right: 10,
                    ),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90.r),

                      color: Color(0xff012844),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          textAlign: TextAlign.start,
                          text: 'What am I learning about how \nfood affects me?',
                        ),

                        Icon(Icons.arrow_forward_ios, color: Color(0xFF8E8E8E)),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  ColumnAppTextWithDot(
                    valueWeight: FontWeight.w400,
                    value1: "“Fried foods often spike later for me”",
                    value2: "“Protein helps slow things down”",
                    value3: "“Timing matters more than amount for fries”",
                  ),

                  SizedBox(height: 30.h),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: 'Recent Viewed Meals ',
                      color: AppColors.blue,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Color(0xff012844),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(AppImages.fries),
                                SizedBox(width: 10.w),
                                AppText(text: 'Fries'),
                              ],
                            ),

                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF8E8E8E),
                            ),
                          ],
                        ),

                        SizedBox(height: 10.h),

                        Container(
                          height: 1,
                          width: double.maxFinite,
                          color: Color(0xff1A4363),
                        ),

                        SizedBox(height: 10.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(AppImages.chicken),
                                SizedBox(width: 10.w),
                                AppText(text: 'Fries'),
                              ],
                            ),

                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF8E8E8E),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32.h),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: 'Recent notes',
                      color: AppColors.blue,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),



                  SizedBox(height: 8.h,),

                  Align(
                    alignment: Alignment.centerLeft,
                      child: AppText(text: 'These are personal observations — not rules or advice.',fontSize: 14.sp,fontWeight: FontWeight.w500,)),


                  SizedBox(height:8.h,),

                  ColumnAppTextWithDot(
                    valueWeight: FontWeight.w400,
                    value1: "““Spikes later if I eat this alone”",
                    value2: "“Works better with protein”",
                  ),
                  
                  
                  SizedBox(height: 10.h,),
                  
                  AppButton(text: 'Export another food', onPressed: (){

                    debugPrint('💖💖🤷‍♂️✌️🤷‍♀️🤷‍♂️🤞😁🎶👌😒🤞🤞🤷‍♂️🤷‍♂️🤷‍♂️');
                  })

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PremiumOfferCard extends StatelessWidget {
  final String title;

  const PremiumOfferCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check, color: AppColors.orangeColor),
        SizedBox(width: 12.w),
        AppText(text: title, fontSize: 16.sp),
      ],
    );
  }
}
