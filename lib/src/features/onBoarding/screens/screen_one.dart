import 'package:flutter/material.dart';
import 'package:sih23/src/core/constants/app_constants.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  AppConstants.onboarding1,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          'Navigate the wool industry with ease'.text.bold.size(16).make(),
          20.heightBox,
        ],
      ),
    );
  }
}
