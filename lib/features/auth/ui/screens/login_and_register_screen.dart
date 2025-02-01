import 'package:e_commerce_grocery_shop_app/app/app_colors.dart';
import 'package:e_commerce_grocery_shop_app/app/assets_path.dart';
import 'package:flutter/material.dart';

class LoginAndRegisterScreen extends StatelessWidget {
  const LoginAndRegisterScreen({super.key});

  static const String name = '/login-register-screen';

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsPath.onBoardingImageFourPng,
              height: 220,
            ),
            SizedBox(height: 60),
            Text(
              'Strain Less Groceries',
              style: textTheme.titleLarge?.copyWith(
                  color: AppColors.themeColor, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Text(
              '''Lorem ipsum is simply dummy text of the printing and typesetting industry.''',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(color: Colors.black54),
            ),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {},
                child: Text('Login'),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.themeColor,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: AppColors.themeColor,
                    width: 1,
                  ),
                ),
              ),
              onPressed: () {},
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
