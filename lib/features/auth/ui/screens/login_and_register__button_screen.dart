import 'package:e_commerce_grocery_shop_app/app/app_colors.dart';
import 'package:e_commerce_grocery_shop_app/app/assets_path.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/login_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginAndRegisterButtonScreen extends StatelessWidget {
  const LoginAndRegisterButtonScreen({super.key});

  static const String name = '/login-and-register-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Image.asset(
              AssetsPath.onBoardingImageFourPng,
              height: 220,
            ),
            SizedBox(height: 60),
            _buildTitleAndDescription(context),
            SizedBox(height: 40),
            _buildLoginAndRegisterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
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
      ],
    );
  }

  Widget _buildLoginAndRegisterButton(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, LoginScreen.name);
          },
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
          onPressed: () {
            Navigator.pushNamed(context, RegisterScreen.name);
          },
          child: Text('Register'),
        ),
      ],
    );
  }
}
