import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/widget/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../component/app_text/app_text.dart';
import '../../../../../../../uitls/constants/appColors/app_colors.dart';
import '../../../../../../../uitls/constants/appImages/app_images.dart';
import '../../controller/history_controller.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize controller if not already exists
    if (!Get.isRegistered<HistoryController>()) {
      Get.put(HistoryController());
    }
    // Load history data
    Get.find<HistoryController>().allHistoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: Get.back,
          child: Image.asset(AppImages.backImage),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: AppText(text: 'History', fontSize: 24),
      ),
      body: Column(
        children: [
          HistoryCard(),
        ],
      ),
    );
  }
}