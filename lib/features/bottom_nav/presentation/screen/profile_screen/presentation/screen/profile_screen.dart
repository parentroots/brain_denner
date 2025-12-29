import 'package:brain_denner/component/app_button/app_button.dart';
import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/profile_screen_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/presentation/screen/edit_profile_screen.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/widget/profice_card.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/widget/profile_option_card.dart';
import 'package:brain_denner/storage/storage_services.dart';
import 'package:brain_denner/uitls/constants/appIcons/app_icons.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../uitls/constants/appColors/app_colors.dart';

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


                  SizedBox(height: 15.h),

                  GestureDetector(
                    onTap: () {
                      
                      Get.to(EditProfileScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0A2A43),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color(0xFF1EA7FF),
                          width: 1,
                        ),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Color(0xFF1EA7FF),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 20.h),


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

                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoute.termsAndServicesScreen);

                    },
                    child: ProfileOptionCard(
                      icon: AppImages.terms,
                      title: 'Terms and Services',

                    ),
                  ),
                  SizedBox(height: 12.h),

                  InkWell(
                    onTap: (){

                      Get.toNamed(AppRoute.privacyPolicyScreen);

                    },
                    child: ProfileOptionCard(
                      icon: AppImages.privacy,
                      title: 'Privacy policy',

                    ),


                  ),


                  SizedBox(height: 20.h,),

                  InkWell(
                    onTap: (){
                      
                      LocalStorage.removeAllPrefData();
                    },
                    child: Container(
                      height: 65.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90.r),
                        color:Color(0xFF00243F)
                      ),
                      child: Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SvgPicture.asset(
                            height: 25.h,
                              width: 20.w,
                              AppIcons.logOut),

                          SizedBox(width: 8.w,),

                          AppText(
                            fontSize: 22.sp,
                              fontWeight: FontWeight.w500,
                              text: 'Log out'),
                        ],
                      ),),
                    ),

                  ),


                  SizedBox(height: 20.h,),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
