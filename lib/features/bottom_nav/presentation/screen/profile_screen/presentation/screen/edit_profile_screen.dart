import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/edit_pofile_controller.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../component/app_button/app_button.dart';
import '../../../../../../../component/app_text_field/app_text_field.dart';
import '../../../../../../auth/presentation/screen/sign_up_screen.dart';
import '../../widget/profice_card.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {


    final EditPofileController controller = Get.put(EditPofileController());
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: Get.back,
          child: Image.asset(AppImages.backImage),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: AppText(text: 'Eit Profile', fontSize: 24),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            SizedBox(height: 25.h),

            Center(
              child: ProfileCard(
                imageFile: controller.file,
                size: 120,
                onCameraTap: () {
                  controller.pickImage();
                },
              ),
            ),
            SizedBox(height: 15.h),


            SizedBox(height: 40.h),
            AppText(
              text: 'Name',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 5.h),

            TextField(
              controller: controller.nameController,
              style: const TextStyle(color: Colors.white), // Text color white
              decoration: InputDecoration(
                hintText: "Enter your name",
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),


            Spacer(),

            AppButton(
              text: 'Save Change',
              onPressed: () {

              },
            ),
            SizedBox(height: 30.h),


          ],
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const InfoWidget({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90.r),
          gradient: LinearGradient(
            colors: [Color(0xFF00243F), Color(0xFF082A45)],
          ),
        ),

      ),
    );
  }
}
