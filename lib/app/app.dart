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
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
      },
      // onGenerateRoute: (RouteSettings settings) {
      //   late Widget widget;
      //
      //   if (settings.name == SplashScreen.name) {
      //     widget = const SplashScreen();
      //   } else if (settings.name == MainBottomNavScreen.name) {
      //     widget = const MainBottomNavScreen();
      //   }
      //
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return widget;
      //     },
      //   );
      // },
    );
  }
}
