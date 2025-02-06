import 'package:flutter/material.dart';
import 'package:e_commerce_grocery_shop_app/app/assets_path.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/widgets/other_login_platform_widget.dart';

class OrLoginWithSection extends StatelessWidget {
  const OrLoginWithSection({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Or login with',
                style: textTheme.titleSmall?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OtherLoginPlatformWidget(
              image: AssetsPath.facebookLogoPng,
            ),
            SizedBox(width: 24),
            OtherLoginPlatformWidget(
              image: AssetsPath.googleLogoPng,
            ),
            SizedBox(width: 24),
            OtherLoginPlatformWidget(
              image: AssetsPath.appleLogoPng,
            ),
          ],
        ),
      ],
    );
  }
}
