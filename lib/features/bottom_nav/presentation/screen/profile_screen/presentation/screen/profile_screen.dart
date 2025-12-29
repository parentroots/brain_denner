import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/profile_screen_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/terms_and_service_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/widget/profice_card.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/widget/profile_option_card.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../uitls/constants/appColors/app_colors.dart';
import '../../controller/privacy_policy_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            centerTitle: true,
            title: AppText(
              text: 'Profile',
              color: Color(0xFFFEFEFE),
              fontSize: 24.sp,
            ),
            backgroundColor: AppColors.primaryColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfileCard(
                        imageFile: controller.file,
                        size: 80,
                        onCameraTap: () {
                          controller.pickImage();
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  AppText(
                    text: 'MD IBRAHIM NAZMUL',
                    color: Colors.white,
                    textAlign: TextAlign.center,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),

                  SizedBox(height: 40.h),

                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoute.accountSettings);

                    },
                    child: ProfileOptionCard(
                      icon: AppImages.person,
                      title: 'Account setting',

                    ),
                  ),

                  SizedBox(height: 12.h),


                  InkWell(
                    onTap: (){

                      Get.toNamed(AppRoute.subscriptionScreen);

                    },
                    child: ProfileOptionCard(
                      icon: AppImages.subscription,
                      title: 'Subscription',

                    ),
                  ),

                  SizedBox(height: 12.h),

                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoute.historyScreen);

                    },
                    child: ProfileOptionCard(
                      icon: AppImages.history,
                      title: 'History',

                    ),
                  ),
                  SizedBox(height: 12.h),

                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoute.ratingScreen);


                    },
                    child: ProfileOptionCard(
                      icon: AppImages.rate,
                      title: 'Rate Our App',

                    ),
                  ),
                  SizedBox(height: 12.h),

                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoute.supportAndContactScreen);

                    },
                    child: ProfileOptionCard(
                      icon: AppImages.support,
                      title: 'Support & contact',

                    ),
                  ),
                  SizedBox(height: 12.h),

                  // InkWell(
                  //   onTap: (){
                  //     Get.toNamed(AppRoute.termsAndServicesScreen);
                  //
                  //   },
                  //   child: ProfileOptionCard(
                  //     icon: AppImages.terms,
                  //     title: 'Terms and Services',
                  //
                  //   ),
                  // ),

                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoute.termsAndServicesScreen);
                    },
                    child: ProfileOptionCard(
                      icon: AppImages.terms,
                      title: 'Terms and Services',
                    ),
                  ),



                  SizedBox(height: 12.h),


                  InkWell(
                    onTap: () {
                      if (!Get.isRegistered<PrivacyPolicyController>()) {
                        Get.put(PrivacyPolicyController());
                      }
                      Get.toNamed(AppRoute.privacyPolicyScreen);
                    },
                    child: ProfileOptionCard(
                      icon: AppImages.privacy,
                      title: 'Privacy policy',
                    ),
                  )

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
