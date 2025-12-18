import 'package:brain_denner/config/appRoutes/app_routes.dart';
import 'package:brain_denner/features/splash/presentation/screens/splash_screen.dart';
import 'package:brain_denner/uitls/constants/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
       return GetMaterialApp(
         debugShowCheckedModeBanner: false,
         initialRoute: AppRoute.mainBottomNavScreen,
         getPages: AppRoute.routes,
         

        );

      },
    );
  }
}
