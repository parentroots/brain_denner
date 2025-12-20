import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/progress_screen/controller/progress_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../uitls/constants/appColors/app_colors.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
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

          body: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: AppText(
                  text: 'Today’s Nutrition Summary',
                  fontSize: 20.sp,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
