import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:sih23/src/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/constants/app_constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _dotController = LiquidController();
  int _currentPage = 0;

  void onPageChange(int activePageIndex) {
    setState(() => _currentPage = activePageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            liquidController: _dotController,
            pages: AppConstants().onBoardingScreens,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            onPageChangeCallback: onPageChange,
          ),
          Positioned(
            bottom: 40,
            child: OutlinedButton(
              onPressed: () {
                if (_currentPage == 2) {
                  Navigator.pushNamed(context, AppRoute.homeRoute);
                }
                int nextPage = _dotController.currentPage + 1;
                _dotController.animateToPage(page: nextPage);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward_ios),
              ).pSymmetric(h: 10),
            ),
          ),
          Positioned(
            top: 10,
            right: 20,
            child: TextButton(
              onPressed: () => _dotController.jumpToPage(page: 2),
              child: 'Skip'.text.semiBold.size(16).color(Colors.black54).make(),
            ),
          ),
          Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              activeIndex: _dotController.currentPage,
              count: AppConstants().onBoardingScreens.length,
              effect: const WormEffect(
                activeDotColor: Colors.blue,
                dotHeight: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
