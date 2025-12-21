import 'package:brain_denner/features/bottom_nav/presentation/screen/home_screen/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../uitls/constants/appColors/app_colors.dart';
import '../../uitls/constants/appIcons/app_icons.dart';
import 'presentation/screen/favourite_screen/presentation/screen/favourite_screen.dart';
import 'presentation/screen/profile_screen/presentation/screen/profile_screen.dart';
import 'presentation/screen/progress_screen/presentaion/screen/progress_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ProgressScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  Color get selectedColor => AppColors.orangeColor;
  Color get unSelectedColor => const Color(0xFF808080);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: _screens[_currentIndex],

      bottomNavigationBar: ClipRRect(
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF00243F),

          selectedItemColor: selectedColor,
          unselectedItemColor: unSelectedColor,
          selectedLabelStyle: TextStyle(
            fontSize: 14.sp,
              fontWeight: FontWeight.w400),
          unselectedLabelStyle:  TextStyle(
            fontSize: 14.sp,
              fontWeight: FontWeight.w400),


          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },

          items: [
            _navItem(AppIcons.home, "Home", 0),
            _navItem(AppIcons.progress, "Progress", 1),
            _navItem(AppIcons.love, "Favourites", 2),
            _navItem(AppIcons.person, "Profile", 3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _navItem(String icon, String label, int index) {
    return BottomNavigationBarItem(
      label: label,
      icon: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          _currentIndex == index ? selectedColor : unSelectedColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
