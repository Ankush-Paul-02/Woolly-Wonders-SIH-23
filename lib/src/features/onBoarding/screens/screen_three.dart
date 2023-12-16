import 'package:flutter/material.dart';
import 'package:sih23/src/core/constants/app_constants.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 65.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppConstants.onboarding3,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          'Revolutionize your wool journey'.text.bold.white.size(18).make(),
          20.heightBox,
        ],
      ),
    );
  }
}
