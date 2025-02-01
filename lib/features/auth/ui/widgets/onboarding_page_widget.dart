import 'package:e_commerce_grocery_shop_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPageWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Image.asset(
              image,
              height: 220,
            ),
            SizedBox(height: 60),
            Text(
              title,
              style: textTheme.titleLarge?.copyWith(
                  color: AppColors.themeColor, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
