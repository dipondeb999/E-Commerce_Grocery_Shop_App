import 'package:e_commerce_grocery_shop_app/app/app_colors.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';

class PasswordChangedSuccessfullyScreen extends StatefulWidget {
  const PasswordChangedSuccessfullyScreen({super.key});

  static const String name = '/password-changed-successfully-screen';

  @override
  State<PasswordChangedSuccessfullyScreen> createState() => _PasswordChangedSuccessfullyScreenState();
}

class _PasswordChangedSuccessfullyScreenState
    extends State<PasswordChangedSuccessfullyScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.verified,
              color: AppColors.themeColor,
              size: 150,
            ),
            SizedBox(height: 16),
            Text(
              'Password Changed!',
              style: TextStyle(
                color: AppColors.themeColor,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your password has been changed successfully.',
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onTapBackToLoginButton,
              child: Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapBackToLoginButton() {
    // if (_formKey.currentState!.validate()) {}
    Navigator.pushNamed(context, LoginScreen.name);
  }
}
