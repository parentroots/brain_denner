import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../component/app_text/app_text.dart';
import '../../../../uitls/constants/appColors/app_colors.dart';
import '../../../../uitls/constants/appIcons/app_icons.dart';

class ContinueWithSocialMediaSection extends StatelessWidget {
  const ContinueWithSocialMediaSection({
    super.key, required this.title, required this.imagePath,
  });


  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('Apple Sign In Clicked==>>>>>>>>>>>>>>>>>>');
      },
      child: Container(
        height: 60.h,
        width: 198.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff00243F), Color(0xff082A45)],
          ),
          borderRadius: BorderRadius.circular(90.r),
          border: Border.all(
            width: 1,
            color: Color(0xff00243F),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(imagePath),
              AppText(
                text: title,
                color: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}