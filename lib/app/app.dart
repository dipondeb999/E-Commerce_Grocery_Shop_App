import 'package:e_commerce_grocery_shop_app/app/app_theme_data.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/login_and_register_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/on_boarding_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/splash_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroceryShopApp extends StatelessWidget {
  const GroceryShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        OnBoardingScreen.name: (context) => OnBoardingScreen(),
        MainBottomNavScreen.name: (context) => MainBottomNavScreen(),
        LoginAndRegisterScreen.name: (context) => LoginAndRegisterScreen(),
      },
    );
  }
}
