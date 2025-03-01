import 'package:e_commerce_grocery_shop_app/app/app_theme_data.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/email_verification_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/login_and_register__button_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/login_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/on_boarding_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/password_changed_successfully_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/register_screen.dart';
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
        LoginAndRegisterButtonScreen.name: (context) => LoginAndRegisterButtonScreen(),
        LoginScreen.name: (context) => LoginScreen(),
        RegisterScreen.name: (context) => RegisterScreen(),
        EmailVerificationScreen.name: (context) => EmailVerificationScreen(),
        OtpVerificationScreen.name: (context) => OtpVerificationScreen(),
        PasswordChangedSuccessfullyScreen.name: (context) => PasswordChangedSuccessfullyScreen(),
      },
    );
  }
}
