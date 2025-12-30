import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../component/app_text/app_text.dart';
import '../../../../../../../uitls/constants/appColors/app_colors.dart';
import '../../../../../../../uitls/constants/appImages/app_images.dart';
import '../controller/history_controller.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 30),
        child: GetBuilder<HistoryController>(
          builder: (controller) {
            if (controller.isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }

            if (controller.historyList.isEmpty) {
              return Center(
                child: AppText(
                  text: 'No history found',
                  fontSize: 16,
                ),
              );
            }

            return ListView.separated(
              itemCount: controller.historyList.length,
              separatorBuilder: (_, __) => SizedBox(height: 15.h),
              itemBuilder: (context, index) {
                final historyItem = controller.historyList[index];
                final foodName = historyItem.food?.name ?? 'Unknown Food';

                return InkWell(
                  onTap: () {},
                  child: Container(
                    height: 64.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF0F4C75),
                          Color(0xFF083358),
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.fries,
                          height: 22.h,
                          width: 22.w,
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: AppText(
                            text: foodName,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16.sp,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}