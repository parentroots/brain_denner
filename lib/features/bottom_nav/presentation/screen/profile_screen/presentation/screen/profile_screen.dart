import 'package:brain_denner/component/app_text/app_text.dart';
import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/controller/profile_screen_controller.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/presentation/screen/edit_profile_screen.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/widget/profile_option_card.dart';
import 'package:brain_denner/uitls/constants/appIcons/app_icons.dart';
import 'package:brain_denner/uitls/constants/appImages/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/network/end_point/api_end_point.dart';
import '../../../../../../../storage/storage_services.dart';
import '../../../../../../../uitls/constants/appColors/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileScreenController>();

    return Obx(() {
      final profile = controller.profileData.value;

      return RefreshIndicator(
        onRefresh: controller.getProfileData,
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            centerTitle: true,
            title: AppText(
              text: 'Profile',
              color: const Color(0xFFFEFEFE),
              fontSize: 24.sp,
            ),
            backgroundColor: AppColors.primaryColor,
          ),
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Column(
                children: [
                  SizedBox(height: 12.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          if (profile == null)
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300,
                              ),
                            )
                          else
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage: profile.image.isNotEmpty
                                  ? NetworkImage(
                                ApiEndPoint.imageUrl + profile.image,
                              )
                                  : null,
                              child: profile.image.isEmpty
                                  ? const Icon(
                                Icons.person,
                                size: 45,
                                color: Colors.grey,
                              )
                                  : null,
                            ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  if (profile == null)
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade400,
                      highlightColor: Colors.grey.shade200,
                      child: Container(
                        height: 20.h,
                        width: 120.w,
                        color: Colors.grey,
                      ),
                    )
                  else
                    AppText(
                      text: profile.name,
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),

                  SizedBox(height: 15.h),

                  GestureDetector(
                    onTap: () {
                      Get.to(() => const EditProfileScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
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
                    onTap: () => Get.toNamed(AppRoute.accountSettings),
                    child: ProfileOptionCard(
                      icon: AppImages.person,
                      title: 'Account setting',
                    ),
                  ),

                  SizedBox(height: 12.h),

                  InkWell(
                    onTap: () => Get.toNamed(AppRoute.subscriptionScreen),
                    child: ProfileOptionCard(
                      icon: AppImages.subscription,
                      title: 'Subscription',
                    ),
                  ),

                  SizedBox(height: 12.h),

                  InkWell(
                    onTap: () => Get.toNamed(AppRoute.historyScreen),
                    child: ProfileOptionCard(
                      icon: AppImages.history,
                      title: 'History',
                    ),
                  ),

                  SizedBox(height: 12.h),

                  InkWell(
                    onTap: () => Get.toNamed(AppRoute.ratingScreen),
                    child: ProfileOptionCard(
                      icon: AppImages.rate,
                      title: 'Rate Our App',
                    ),
                  ),

                  SizedBox(height: 12.h),

                  InkWell(
                    onTap: () =>
                        Get.toNamed(AppRoute.supportAndContactScreen),
                    child: ProfileOptionCard(
                      icon: AppImages.support,
                      title: 'Support & contact',
                    ),
                  ),

                  SizedBox(height: 12.h),

                  InkWell(
                    onTap: () =>
                        Get.toNamed(AppRoute.termsAndServicesScreen),
                    child: ProfileOptionCard(
                      icon: AppImages.terms,
                      title: 'Terms and Services',
                    ),
                  ),

                  SizedBox(height: 12.h),

                  InkWell(
                    onTap: () =>
                        Get.toNamed(AppRoute.privacyPolicyScreen),
                    child: ProfileOptionCard(
                      icon: AppImages.privacy,
                      title: 'Privacy policy',
                    ),
                  ),

                  SizedBox(height: 20.h),

                  InkWell(
                    onTap: showCustomLogoutDialog,
                    child: Container(
                      height: 65.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90.r),
                        color: const Color(0xFF00243F),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.logOut,
                              height: 25.h,
                              width: 20.w,
                            ),
                            SizedBox(width: 8.w),
                            AppText(
                              text: 'Log out',
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }









  void showCustomLogoutDialog() {
    Get.dialog(
      Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: Get.width * 0.8,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.logout, size: 48, color: Colors.red),
                const SizedBox(height: 12),
                const Text(
                  "Logout",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Are you sure you want to Log-Out ?",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const AppText(
                          text: 'Cancel',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                        ),
                        onPressed: () async {
                          await LocalStorage.removeAllPrefData();
                          Get.offAllNamed(AppRoute.signInScreen);
                        },
                        child: const AppText(
                          text: 'Log Out',
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
