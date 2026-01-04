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
class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {

  final ProgressScreenController controller = Get.put(ProgressScreenController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showPaymentBottomSheetDialog();
      controller.fetchNotes();
    });
  }

  void _showPaymentBottomSheetDialog() {
    Get.bottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Keep learning how food\naffects you",
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.close, color: Colors.white70),
                ),
              ],
            ),

            SizedBox(height: 12),

            Text(
              "Fast Food Buddy helps you understand patterns — not just numbers",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),

            SizedBox(height: 20),

            // Item 1
            Row(
              children: [
                Icon(Icons.check, color: Colors.orange, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Explore more restaurants",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // Item 2
            Row(
              children: [
                Icon(Icons.check, color: Colors.orange, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Save unlimited food notes",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // Item 3
            Row(
              children: [
                Icon(Icons.check, color: Colors.orange, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Build personal digestion insights over time",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),

            SizedBox(height: 28),

            GestureDetector(
              onTap: () {
                // Subscription logic here
                Get.back();
              },
              child: Container(
                height: 52,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFB347),
                      Color(0xFFFF9800),
                    ],
                  ),
                ),
                child: Text(
                  "Unlock learning for \$4.99/m",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
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
                      'Understanding patterns over time — not daily perfection.  ',
                      fontSize: 20.sp,
                      color: AppColors.blue,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  InkWell(
                    onTap: (){

                      showFoodNotesDialog(context);

                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 15,
                        top: 10,
                        bottom: 10,
                        right: 10,
                      ),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Color(0xff012844),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            textAlign: TextAlign.start,
                            text:
                            'What am I learning about how \nfood affects me?',
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: Color(0xFF8E8E8E)),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),



                  Obx(() {
                    final notes = Get.find<ProgressScreenController>().notes;

                    if (notes.isEmpty) {
                      return Text(
                        "No notes yet.",
                        style: TextStyle(color: Colors.white),
                      );
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: notes.map((note) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 6.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 6.h),
                                width: 6.w,
                                height: 6.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  note.text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }),




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
                                AppText(text: 'Chicken'),
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

                  SizedBox(height: 8.h),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text:
                      'These are personal observations — not rules or advice.',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  ColumnAppTextWithDot(
                    valueWeight: FontWeight.w400,
                    value1: '"Spikes later if I eat this alone"',
                    value2: '"Works better with protein"',
                  ),

                  SizedBox(height: 10.h),

                  AppButton(
                    text: 'Export another food',
                    onPressed: () {
                      Get.toNamed(AppRoute.restaurantListScreen);
                    },
                  ),

                  SizedBox(height: 20.h),



                  /////////






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


void showFoodNotesDialog(BuildContext context) {
  final controller = Get.find<ProgressScreenController>();

  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFFE8E8E8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'What have I noticed about\nhow food affects me?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      height: 1.3,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.close,
                    color: Colors.black54,
                    size: 24,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Notes List
            Obx(() => Column(
              children: controller.notes
                  .map((note) => Container(
                margin: EdgeInsets.symmetric(vertical: 6),
                padding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Color(0xFFCFCFCF),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  note.text,
                  style: TextStyle(
                      color: Colors.black, fontSize: 14),
                ),
              ))
                  .toList(),
            )),

            SizedBox(height: 20),

            // Bottom Buttons
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Open Add Note Dialog
                      Get.back(); // Close current dialog
                      showFoodAddNotesDialog(context);
                    },
                    child: Container(
                      height: 40.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.sendNotesToServer(); // Send to server
                    },
                    child: Container(
                      height: 40.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFB347),
                            Color(0xFFFF9800),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Save Note',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: true,
  );
}



void showFoodAddNotesDialog(BuildContext context){
  final controller = Get.find<ProgressScreenController>();

  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFFE8E8E8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(
                  'What have I noticed about\nhow food affects me?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )),
                GestureDetector(
                  onTap: ()=> Get.back(),
                  child: Icon(Icons.close, size: 24),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Input field
            TextField(
              controller: controller.addNoteTEController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Write your note here",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),

            SizedBox(height: 16),

            // Notes List

            Obx(() => Container(
              height: 200,
              child: ListView.separated(
                itemCount: controller.notes.length,
                separatorBuilder: (_,__)=> SizedBox(height: 12),
                itemBuilder: (context,index){
                  final note = controller.notes[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(note.text, style: TextStyle(fontSize: 14))),
                        GestureDetector(
                          onTap: ()=> controller.removeNoteLocal(index),
                          child: Container(
                            width:24,height:24,
                            decoration: BoxDecoration(color: Color(0xFF999999), shape: BoxShape.circle),
                            child: Icon(Icons.remove, color: Colors.white, size:16),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )),

            SizedBox(height:20),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: ()=> controller.addNoteLocal(controller.addNoteTEController.text),
                    child: Container(
                      height: 50, alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xFFFFB347), Color(0xFFFF9800)]),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text("Add Note", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
                SizedBox(width:12),
                Expanded(
                  child: GestureDetector(
                    onTap: ()=> controller.sendNotesToServer(),
                    child: Container(
                      height:50, alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width:2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text("Save to Server", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
    barrierDismissible: true,
  );
}




