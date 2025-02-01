import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_grocery_shop_app/app/assets_path.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/login_and_register_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/widgets/onboarding_page_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String name = '/on-boarding-screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    OnboardingPageWidget(
        image: AssetsPath.onBoardingImageOnePng,
        title: 'Fresh & Healthy Grocery',
        description: '''Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.''',
    ),
    OnboardingPageWidget(
        image: AssetsPath.onBoardingImageTwoPng,
        title: 'Add to Cart',
        description: '''Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.''',
    ),
    OnboardingPageWidget(
        image: AssetsPath.onBoardingImageThreePng,
        title: 'Easy & Fast Delivery',
        description: '''Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.''',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: _pages,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                // scrollPhysics: NeverScrollableScrollPhysics(),
                onPageChanged: (index, reason) {
                  _currentIndex = index;
                  setState(() {});
                },
              ),
            ),
          ),
          if (_currentIndex < 2)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  _currentIndex++;
                },
                child: Text('Next'),
              ),
            ),
          if (_currentIndex == 2)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginAndRegisterScreen.name);
                },
                child: Text('Get Started'),
              ),
            ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
