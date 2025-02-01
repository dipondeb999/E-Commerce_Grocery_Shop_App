import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_grocery_shop_app/app/app_colors.dart';
import 'package:e_commerce_grocery_shop_app/app/assets_path.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/screens/login_and_register__button_screen.dart';
import 'package:e_commerce_grocery_shop_app/features/auth/ui/widgets/onboarding_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String name = '/on-boarding-screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final CarouselSliderController _carouselSliderController = CarouselSliderController();
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
              carouselController: _carouselSliderController,
              items: _pages,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  _currentIndex = index;
                  setState(() {});
                },
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: PageController(initialPage: _currentIndex),
            count: _pages.length,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColors.themeColor,
              dotColor: AppColors.themeColor,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: _onTapNextButton,
              child: Text(_currentIndex == _pages.length - 1 ? "Get Started" : "Next"),
            ),
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }

  void _onTapNextButton() {
    if (_currentIndex < _pages.length - 1) {
      _carouselSliderController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(context, LoginAndRegisterButtonScreen.name);
    }
  }
}
