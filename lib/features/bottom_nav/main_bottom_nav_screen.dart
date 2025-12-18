import 'package:brain_denner/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/favourite_screen/favourite_screen.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/home_scren/home_screen.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/profile_screen.dart';
import 'package:brain_denner/features/bottom_nav/presentation/screen/progress_screen/progress_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../uitls/constants/appColors/app_colors.dart';
import '../../uitls/constants/appIcons/app_icons.dart';
import 'presentation/controller/main_bottom_nav_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [

    HomeScreen(),
    ProgressScreen(),
    FavouriteScreen(),
    ProfileScreen()

  ];

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MainBottomNavController>(builder: (controller){
      return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: _screens[_currentIndex],

        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor:Color(0xFF00243F),
            selectedItemColor:Color(0xFFFF6D00),
            unselectedItemColor: Colors.white70,

            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.home),
                label: "Home",
                activeIcon: SvgPicture.asset(
                  AppIcons.home,
                  width: 24,
                  height: 24,
                  color: Colors.blue, // selected
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.progress),
                label: "Progress",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.love),
                label: "Favourites",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.person),
                label: "Profile",
              ),
            ],
          ),
        ),
      );
    });

  }
}