
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/app_text_field/app_text_field.dart';

class SearchBoxWidget extends StatelessWidget {
  const SearchBoxWidget({super.key, required this.controller, this.hintText});

  final TextEditingController controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 398.w,
      child: AppTextField(
        prefixIcon: Icons.search,
        hintColor: Color(0xff00D4FF),
        hintSize: 20.sp,
        controller: controller,
        hintText: hintText??'Restaurant',
      ),
    );
  }
}
