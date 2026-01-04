import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../component/app_button/app_button.dart';
import '../../../../../../../component/app_text_field/app_text_field.dart';
import '../../controller/edit_pofile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: Get.back,
          child: Image.asset(AppImages.backImage),
          
        ),
        backgroundColor: AppColors.primaryColor,

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 20.h),
        child: Column(
          children: [
            // ---------- Profile Image ----------
            GetBuilder<EditProfileController>(
              builder: (_) {
                return GestureDetector(
                  onTap: controller.pickImage,
                  child: Stack(
                    children: [
                      Container(
                        width: 120.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                          image: controller.profileImage != null
                              ? DecorationImage(
                            image: controller.profileImage!,
                            fit: BoxFit.cover,
                          )
                              : null,
                        ),
                        child: controller.profileImage == null
                            ? Icon(
                          Icons.person,
                          size: 100,
                          color: Colors.grey[600],
                        )
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color:  Colors.black,
                            shape: BoxShape.circle,

                          ),
                          child:Image.asset(AppImages.camera),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: 14.h),

            AppText(text: controller.name,fontSize: 24.sp,),

            SizedBox(height: 40.h),

            GetBuilder<EditProfileController>(
              builder: (controller) {
                return AppTextField(

                  hintSize: 18.sp,
                  controller: controller.nameController,
                  hintText: "Enter Your Name",
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 70.h, left: 13.w, right: 13.w),
        child: GetBuilder<EditProfileController>(
          builder: (controller) {
            return AppButton(
              isLoading: controller.isLoading,
              text: 'Save Changes',
              onPressed: () {
                if (!controller.isLoading) controller.editProfileUpdate();
              },
            );
          },
        ),
      ),
    );
  }
}
