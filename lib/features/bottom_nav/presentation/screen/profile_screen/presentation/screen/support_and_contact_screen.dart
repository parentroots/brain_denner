import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/app_text_field/app_text_field.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/support_and_contact_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../component/app_text/app_text.dart';
import '../../../../../../../uitls/constants/appColors/app_colors.dart';
import '../../../../../../../uitls/constants/appIcons/app_icons.dart';
import '../../../../../../../uitls/constants/appImages/app_images.dart';

class SupportAndContactScreen extends StatelessWidget {
  const SupportAndContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportAndContactScreenController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            leadingWidth:70,
            leading: Row(
              children: [

                SizedBox(width: 10.w,),
                InkWell(
                  onTap: Get.back,
                  child: SizedBox(
                      child: SvgPicture.asset(AppIcons.back)),
                ),
              ],
            ),
            centerTitle: true,
            title: AppText(
              text: 'Support & contact',
              color: Color(0xFFFEFEFE),
              fontSize: 24.sp,
            ),
            backgroundColor: AppColors.primaryColor,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40.h),

                  AppText(
                    text:
                        'If you’re experiencing any Issues, Please let us know. We’ll try to solve them as soon as possible',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),

                  SizedBox(height: 57.h),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: 'Title',
                      color: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 14,),
                  AppTextField(
                    controller: controller.titleTEController,
                    hintText: 'Title',
                  ),

                  SizedBox(height: 47.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: 'Explain the issues',
                      color: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 14,),
                  AppTextField(
                    maxLine: 6,
                    controller: controller.issuesTEController,
                    hintText: 'Issue',
                  ),

                  SizedBox(height: 40.h,),


                  AppButton(
                    text: controller.isLoading ? 'Submitting...' : 'Submit',
                    onPressed: () {
                      controller.postSupportContact();
                    },
                  ),

                  SizedBox(height: 40.h,),

                  Column(
                    children: [

                      // WhatsApp
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(text: 'Whatsapp : ', maxLines: 1, fontSize: 15),
                          InkWell(
                            onTap: () {
                              if (controller.contactInfo?.whatsApp?.isNotEmpty ?? false) {
                                controller.sendWhatsAppMessage(
                                  controller.contactInfo!.whatsApp!,
                                  'Hello Dear, I need support. Please help me',
                                );
                              } else {
                                Get.snackbar("Error", "WhatsApp number not available");
                              }
                            },
                            child: AppText(
                              text: controller.contactInfo?.whatsApp ?? '',
                              maxLines: 1,
                              fontSize: 15,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),

                      // Email
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(text: 'E-mail : ', maxLines: 1, fontSize: 15),
                          InkWell(
                            onTap: () {
                              if (controller.contactInfo?.email?.isNotEmpty ?? false) {
                                controller.sendEmail(controller.contactInfo!.email!);
                              } else {
                                Get.snackbar("Error", "Email not available");
                              }
                            },
                            child: AppText(
                              text: controller.contactInfo?.email ?? '',
                              maxLines: 1,
                              fontSize: 15,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),

                      // Phone
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(text: 'Phone: ', maxLines: 1, fontSize: 15),
                          InkWell(
                            onTap: () {
                              if (controller.contactInfo?.phone?.isNotEmpty ?? false) {
                                controller.makePhoneCall(controller.contactInfo!.phone!);
                              } else {
                                Get.snackbar("Error", "Phone number not available");
                              }
                            },
                            child: AppText(
                              text: controller.contactInfo?.phone ?? '',
                              maxLines: 1,
                              fontSize: 15,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 25.h,),


                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
