import 'package:brain_denner/features/bottom_nav/presentation/screen/favourite_screen/presentation/widget/favourite_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../uitls/constants/appColors/app_colors.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text('Favourites',style: TextStyle(fontSize: 24.sp,
        color: Color(0xFFFEFEFE),
        fontWeight: FontWeight.w500),),
      ),
      body: Column(
        children: [


          SizedBox(height: 24.h,),

          FavouriteItemCard()


          
        ],
      ),
    );
  }
}
