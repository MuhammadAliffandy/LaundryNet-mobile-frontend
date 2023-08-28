import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_text_style.dart';

import '../../app/assets/app_assets.dart';
import '../../app/theme/app_colors.dart';

class OnboardingView extends StatefulWidget {
  static const routeName = '/onboarding-screen';

  const OnboardingView({
    super.key,
  });

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int pageIndex = 0;
  bool pageEnd = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: pageEnd == true
          ? onBoardingEnd()
          : Column(
              children: [
                Expanded(
                  child: PageView(
                    pageSnapping: true,
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        pageIndex = value;
                      });
                    },
                    children: [
                      onBoarding1(),
                      onBoarding2(),
                      onBoarding3(),
                      onBoarding4(),
                    ],
                  ),
                ),
                indicator(),
                buttonDown(
                  () {
                    _pageController.animateToPage(
                      pageIndex + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.decelerate,
                    );

                    setState(() {
                      pageIndex == 3 ? pageEnd = true : pageEnd = false;
                    });
                  },
                ),
              ],
            ),
    );
  }

  Widget onBoardingEnd() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
            color: AppColors.primary,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppCardContainer(
                  backgroundColor: AppColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(52),
                    bottomRight: Radius.circular(52),
                  ),
                  padding: EdgeInsets.only(bottom: AppSizes.padding * 2),
                  child: onBoardingTemplate(
                    AppAsset.onboardingImage,
                    'Lorem ipsum dolor sit amet consectetur. Quam penatibus.',
                    AppSizes.padding * 1.7,
                  ),
                ),
                SizedBox(
                  height: AppSizes.padding,
                )
              ],
            )),
        buttonBottomEnd()
      ],
    );
  }

  Widget onBoarding1() {
    return onBoardingTemplate(
      AppAsset.onboardingImage,
      'Lorem ipsum dolor sit amet consectetur. Quam penatibus.',
      AppSizes.padding * 1.8,
    );
  }

  Widget onBoarding2() {
    return onBoardingTemplate(
      AppAsset.onboarding2Image,
      'Lorem ipsum dolor sit amet consectetur. Quam penatibus.',
      AppSizes.padding * 1.8,
    );
  }

  Widget onBoarding3() {
    return onBoardingTemplate(
      AppAsset.onboarding2Image,
      'Lorem ipsum dolor sit amet consectetur. Quam penatibus.',
      AppSizes.padding * 1.8,
    );
  }

  Widget onBoarding4() {
    return onBoardingTemplate(
      AppAsset.onboarding2Image,
      'Lorem ipsum dolor sit amet consectetur. Quam penatibus.',
      AppSizes.padding * 1.8,
    );
  }

  Widget indicator() {
    return DotsIndicator(
      dotsCount: 4,
      position: pageIndex,
      decorator: DotsDecorator(
        size: const Size.square(7.0),
        activeSize: const Size(30.0, 7.0),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        color: AppColors.primary.withOpacity(0.50),
        activeColor: AppColors.primary,
        spacing: const EdgeInsets.all(4),
      ),
    );
  }

  Widget buttonBottomEnd() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppLongCard(
          borderRadius: BorderRadius.circular(0),
          backgroundColor: AppColors.primary,
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.padding * 2,
            horizontal: AppSizes.padding,
          ),
          children: [
            Expanded(
              child: AppButton(
                text: 'Masuk',
                rounded: true,
                buttonColor: AppColors.blueLv5,
                onTap: () {},
                textColor: AppColors.primary,
              ),
            ),
            SizedBox(
              width: AppSizes.padding / 1.5,
            ),
            Expanded(
              child: AppButton(
                rounded: true,
                leftIcon: Icons.shopping_cart,
                text: 'Daftar',
                buttonColor: AppColors.blueLv5,
                textColor: AppColors.primary,
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buttonDown(void Function() onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.padding * 2,
        horizontal: AppSizes.padding * 1.5,
      ),
      child: AppCardContainer(
        padding: const EdgeInsets.all(0),
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: AppColors.blueLv4,
            offset: Offset(4, 8),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
        child: AppButton(
          text: 'Next',
          textColor: AppColors.white,
          buttonColor: AppColors.primary,
          rounded: true,
          onTap: onTap,
        ),
      ),
    );
  }

  Widget onBoardingTemplate(
    String image,
    String text,
    double fontSize,
  ) {
    return backgroundCircle(Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: AppColumnInk(
        children: [
          SizedBox(
            height: AppSizes.padding * 4,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
            child: AppCardContainer(
              padding: const EdgeInsets.all(0),
              backgroundColor: AppColors.transparent,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(210),
                topRight: Radius.circular(210),
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: AppSizes.padding * 3),
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyle.bold(size: fontSize, color: AppColors.primary),
          ),
        ],
      ),
    ));
  }

  Widget backgroundCircle(Widget image) {
    return Stack(
      children: [
        image,
        Positioned(
            top: 486,
            left: 287,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.blueLv4,
                shape: BoxShape.circle,
              ),
              width: 18,
              height: 18,
            )),
        Positioned(
            top: 459,
            left: 86,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.blueLv4,
                shape: BoxShape.circle,
              ),
              width: 40,
              height: 40,
            )),
        Positioned(
            top: 316,
            left: 32,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.blueLv4,
                shape: BoxShape.circle,
              ),
              width: 20,
              height: 20,
            )),
        Positioned(
            top: 378,
            left: 356,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.blueLv4,
                shape: BoxShape.circle,
              ),
              width: 20,
              height: 20,
            )),
        Positioned(
            top: 197,
            left: 28,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.blueLv4,
                shape: BoxShape.circle,
              ),
              width: 10,
              height: 10,
            )),
        Positioned(
            top: 209,
            left: 385,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.blueLv4,
                shape: BoxShape.circle,
              ),
              width: 10,
              height: 10,
            )),
        Positioned(
            top: 291,
            left: 387,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.blueLv4,
                shape: BoxShape.circle,
              ),
              width: 12,
              height: 12,
            )),
        Positioned(
            top: 101,
            left: 364,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.blueLv4,
                shape: BoxShape.circle,
              ),
              width: 28,
              height: 28,
            )),
        Positioned(
            top: 60,
            left: 42,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.blueLv4,
                shape: BoxShape.circle,
              ),
              width: 36,
              height: 36,
            )),
        Positioned(
            top: 26,
            left: 151,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.blueLv4,
                shape: BoxShape.circle,
              ),
              width: 14,
              height: 14,
            )),
        Positioned(
            top: 38,
            left: 301,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.blueLv4,
                shape: BoxShape.circle,
              ),
              width: 12,
              height: 12,
            ))
      ],
    );
  }
}
