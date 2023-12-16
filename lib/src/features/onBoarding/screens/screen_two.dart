import 'package:flutter/material.dart';
import 'package:sih23/src/core/constants/app_constants.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 65.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppConstants.onboarding2,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          'Empower your wool business'.text.bold.size(18).make()
        ],
      ),
    );
  }
}
