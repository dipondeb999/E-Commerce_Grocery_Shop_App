import 'package:e_commerce_grocery_shop_app/app/app_colors.dart';
import 'package:e_commerce_grocery_shop_app/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String name = '/on-boarding-screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              _currentIndex = index;
              setState(() {});
            },
          ),
          _pageDetails(
            image: AssetsPath.onBoardingImageOnePng,
            title: 'Fresh & Healthy Grocery',
            subtitle: '''Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.''',
          ),
          _pageDetails(
            image: AssetsPath.onBoardingImageTwoPng,
            title: 'Add to Cart',
            subtitle: '''Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.''',
          ),
          _pageDetails(
            image: AssetsPath.onBoardingImageThreePng,
            title: 'Easy & Fast Delivery',
            subtitle: '''Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.''',
          ),
          _pageDetails(
            image: AssetsPath.onBoardingImageFourPng,
            title: 'Strain Less Groceries',
            subtitle: '''Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.''',
          ),
          SizedBox(height: 50),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                onDotClicked: (index) {
                  _pageController.jumpToPage(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageDetails({required String image, required String title, required String subtitle}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 250,
        ),
        SizedBox(height: 80),
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(
              color: AppColors.themeColor,
              fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: 20),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(color: Colors.black54),
        ),
      ],
    );
  }
}
